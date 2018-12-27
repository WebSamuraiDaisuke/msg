class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @questions = Question.new
  end

  def create
    @questions = Question.new(strong_params)
    if @questions.save
      redirect_to root_path, notice: "Success to save #{@questions.title}"
    else
      flash[:alert] = "Save error"
      render :new
    end
  end

  def show
    @questions = Question.find(params[:id])
    @answers = Answer.new
  end

  def edit
    @questions = Question.find(params[:id])
  end

  def update
    @questions = Question.find(params[:id])
    if @questions.update(strong_params)
      redirect_to root_path, notice: "Success"
    else
      flash[:alert] = "update is failed"
      render :edit
    end
  end

  def destroy
    @questions = Question.find(params[:id])
    @questions.destroy
    redirect_to root_path, notice: "Delete succeed"
  end

  private

  def strong_params
    params.require(:question).permit(:title, :content)
  end
end

