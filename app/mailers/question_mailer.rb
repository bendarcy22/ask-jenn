class QuestionMailer < ApplicationMailer
  def new_question(question)
    @question = question

    mail(
      to: "example@gmail.com",
      subject: "New Question from #{question.name}"
    )
  end
end
