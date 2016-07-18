require 'twilio-ruby'

class QuestionsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = "Jenn will get back to you shortly"
      QuestionMailer.new_question(@question).deliver_later
      notify(@question.name, @question.body)
      redirect_to questions_path
    else
      render :new
    end
  end

  def notify(from, msg)
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message = client.messages.create from: '+16179367820', to: '+1', body: "#{from} - #{msg}"
    render plain: message.status
  end
end

private

def question_params
  params.require(:question).permit(
  :name,
  :body
  )
end
