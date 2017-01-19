class AnswerMailer < ApplicationMailer
  def answer_email(answer, code)
    @listen_url = "https:///tuarrah.com/listen?code=#{code}&questionId=#{answer.question_id}"
    mail(to: answer.email, subject: "Your Tuarrah EP")
  end
end
