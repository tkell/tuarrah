class AnswerMailerPreview < ActionMailer::Preview
  def answer_email
      answer = Answer.first
      AnswerMailer.answer_email(answer, "some_fake_url_code")
  end
end
