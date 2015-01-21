class QuestionTypesController < ApplicationController
  before_action :set_question_type, only: [:show, :edit, :update, :destroy]

  def index
    @question_types = QuestionType.all
  end

  def show
  end

  def new
    @question_type = QuestionType.new
    @question_types = QuestionType.all
  end

  def edit
  end

  def create
    @question_types = QuestionType.all
    @question_type = QuestionType.new(question_type_params)
    if @question_type.save
      redirect_to new_question_type_path
      flash[:notice] =  'question type was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @question_type.update(question_type_params)
      redirect_to new_question_type_path
      flash[:notice] =  'question type was successfully updated.'
    else
      render 'new'
    end
  end

  def destroy
    @question_type.destroy
    redirect_to new_question_type_path
    flash[:notice] =  'question type was successfully destroyed.'
  end

  private

  def set_question_type
    @question_type = QuestionType.find(params[:id])
  end

  def question_type_params
    params.require(:question_type).permit!
  end
end
