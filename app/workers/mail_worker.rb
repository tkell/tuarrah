class MailWorker
  include Sidekiq::Worker

  def send(answer, code)
    AnswerMailer.answer_email(answer, code).deliver
  end
end
