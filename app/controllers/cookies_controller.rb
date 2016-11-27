class CookiesController < ApplicationController
  before_action :set_cooky, only: [:show, :update, :destroy]

  # GET /cookies/verify/<code>
  def verify
    code = params["code"]
    @cooky = Cookie.where(code: code).first

    if @cooky.nil?
      render json: {verification: false}
    else
      render json: {verification: true}
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cooky
      @cooky = Cookie.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cooky_params
      params.require(:cooky).permit(:code)
    end
end
