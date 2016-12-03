class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy]

  # GET /answers
  def index
    # This always returns 5 things
    # It takes an offset param that is 0 if it is not null
    # I am going to increment the offset on the client side, because I am a baller.
    # That will fuck up a bit when we run out of answers,
    # but that is enough of an edge case that I am not going to worry about it for now
    offset  = params[:offset].to_i || 0
    @answers = Answer.where(approved: true, question_id: params[:question_id]).limit(5).offset(offset)
    render json: @answers
  end

  # GET /answers/1
  def show
    render json: @answer
  end

  # POST /answers
  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer: params[:answer],
                                    email: params[:email],
                                    question_id: params[:question_id])
    @answer.approved = false
    if @answer.save
      code = SecureRandom.urlsafe_base64
      @cookie = Cookie.new(answer_id: @answer.id, code: code)
      if @cookie.save!
        results = {answer: @answer, cookie: @cookie}

        ## probably need to integrate this with SideKiq, woo
        AnswerMailer.answer_email(@answer, code).deliver_later


        render json: results, status: :created, location: [@question, @answer]
      else
        render json: @cookie.errors, status: :unprocessable_entity
      end
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def answer_params
      params.require(:answer).permit(:answer, :approved)
    end
end
