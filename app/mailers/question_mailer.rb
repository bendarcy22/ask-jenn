class QuestionMailer < ApplicationMailer
  def new_question(question)
    @question = question

    mail(
    # jenn.eng@wi.mit.eu
      to: example@salami.com,
      subject: "New Question from #{question.name}"
    )
  end
end
