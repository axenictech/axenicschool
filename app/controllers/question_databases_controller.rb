# QuestionDatabasesController
class QuestionDatabasesController < ApplicationController
  def new
    @que = QuestionDatabase.new
    @ques = QuestionDatabase.all
  end

  def edit
  end

  def create
    @ques = QusetionType.all
    @que = QusetionType.new(params[:qusetion_database])
    if @que.save
      redirect_to new_qusetion_database_path
      flash[:notice] =  'Qusetion was successfully created.'
    else
      render 'new'
    end
  end

  def update
    if @que.update(qusetion_type_params)
      redirect_to new_qusetion_database_path
      flash[:notice] =  'Qusetion was successfully updated.'
    else
      render 'new'
    end
  end

  def destroy
    @que.destroy
    redirect_to new_qusetion_database_path
    flash[:notice] =  'Qusetion was successfully destroyed.'
  end

  def option
    @option = params[:id].to_i
  end

  private

  def set_qusetion_type
    @que = QusetionDatabase.find(params[:id])
  end

  def qusetion_type_params
    params.require(:qusetion_database).permit!
  end
end
