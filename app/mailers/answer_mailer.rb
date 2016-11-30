class AnswerMailer < ApplicationMailer
  default from: tuarrah@tuarrah.come

  def answer_email(answer, code)
    @url = "https:///tuarrah.com/download?code=#{code}&questionId=#{answer.question_id}"
    mail(to: answer.email, subject: "Thanks for Tuarrah")
end
