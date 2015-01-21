# QuestionDatabasesController
class QuestionDatabasesController < ApplicationController
  def new
    @que = QuestionDatabase.new
    @ques = QuestionDatabase.all
  end

  def edit
  end

  def create
    @ques = QuestionType.all
    @que = QuestionType.new(question_type_params)
    if @que.save
      redirect_to new_question_database_path
      flash[:notice] =  'question was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @que.update(question_type_params)
      redirect_to new_question_database_path
      flash[:notice] =  'question was successfully updated.'
    else
      render 'new'
    end
  end

  def destroy
    @que.destroy
    redirect_to new_question_database_path
    flash[:notice] =  'question was successfully destroyed.'
  end

  def option
    @option = params[:id].to_i
  end

  private

  def set_question_type
    @que = questionDatabase.find(params[:id])
  end

  def question_type_params
    params.require(:question_database).permit!
  end
end
