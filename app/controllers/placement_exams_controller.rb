# PlacementExamsController
class PlacementExamsController < ApplicationController
  before_action :set_placement_exam, only: [:show, :edit, :update, :destroy]

  def index
     @companies = Company.all
     @placement_news  =PlacementNews.all
  end

  def insert
     @companies = Company.all
     @placement_news  =PlacementNews.all
  end

  def create_exam
    @exam = PlacementExam.new
    @company = Company.all
  end

  def insert_exam
    
  end

  def exam
      
  end
  
  def placement_tpo
    @placement_exams = PlacementExam.all
  end

  

  def setting_index
  end

  def new
    @placement_exam = PlacementExam.new
  end


  def edit
  end


  def create
    @placement_exam = PlacementExam.new(placement_exam_params)
    @placement_exam.save
  end

  def update
    respond_to do |format|
      if @placement_exam.update(placement_exam_params)
        format.html { redirect_to @placement_exam, notice: 'Placement exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @placement_exam }
      else
        format.html { render :edit }
        format.json { render json: @placement_exam.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @placement_exam.destroy
    respond_to do |format|
      format.html { redirect_to placement_exams_url, notice: 'Placement exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def question_type
    @type = params[:type]
  end

  private

  def set_placement_exam
    @placement_exam = PlacementExam.find(params[:id])
  end

 
  def placement_exam_params
    params.require(:placement_exam).permit(:question_type_id, :timeperiod, :start_date, :end_date, :company_id)
  end
end
