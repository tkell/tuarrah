class MailWorker
  include Sidekiq::Worker

  def perform(answer_id, code)
    answer = Answer.find(answer_id)
    AnswerMailer.answer_email(answer, code).deliver
  end
end
