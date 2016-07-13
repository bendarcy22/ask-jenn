class QuestionsController < ApplicationController
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
    redirect_to questions_path
  else
    render :new
  end
end
end

private

def question_params
  params.require(:question).permit(
  :name,
  :body
  )
end
