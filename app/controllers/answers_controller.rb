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
    @answers = @questions.answers.find(params[:id])
  end

  def update
    @questions = Question.find(params[:question_id])
    @answers = @questions.answers.find(params[:id])
    if @answers.update(answer_params)
      redirect_to question_path(@questions), notice: "Success!"
    else
      flash[:alert] = "Failed"
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:id])
    @answer.destroy
    redirect_to question_path(@question), notice: "Success!"
  end

  private

  def answer_params
    params.require(:answer).permit(:name, :content, :question_id)
  end
end
