class AnswersController < ApplicationController
  def create
    @questions = Question.find(params[:question_id])
    @answers = Answer.new
    if @answers.update(answer_params)
      redirect_to question_path(@questions), notice: "Update is succeded"
    else
      redirect_to question_path(@questions), alert: "Update is failed"
    end
  end

  def edit
    @questions = Question.find(params[:question_id])
    @answers = @questions.answers(params[:id])
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :content, :question_id)
  end
end
