class AnswerMailer < ApplicationMailer
  default from: "tuarrah@tuarrah.com"

  def answer_email(answer, code)
    @url = "https:///tuarrah.com/listen?code=#{code}&questionId=#{answer.question_id}"
    mail(to: answer.email, subject: "Thanks for Tuarrah")
  end
end
