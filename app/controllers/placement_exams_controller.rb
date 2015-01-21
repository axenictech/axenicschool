class PlacementExamsController < ApplicationController
  before_action :set_placement_exam, only: [:show, :edit, :update, :destroy]

  # GET /placement_exams
  # GET /placement_exams.json
  def index

  end

  def insert_exam
  end

  def insert

    @companies = Company.all
     @placement_news  =PlacementNews.all

  end
  
  def placement_tpo
    @placement_exams = PlacementExam.all
  end
  # GET /placement_exams/1
  # GET /placement_exams/1.json
  def show
  end

  def setting_index
  end

  # GET /placement_exams/new
  def new
    @placement_exam = PlacementExam.new
  end

  # GET /placement_exams/1/edit
  def edit
  end

  # POST /placement_exams
  # POST /placement_exams.json
  def create
    @placement_exam = PlacementExam.new(placement_exam_params)

    respond_to do |format|
      if @placement_exam.save
        format.html { redirect_to @placement_exam, notice: 'Placement exam was successfully created.' }
        format.json { render :show, status: :created, location: @placement_exam }
      else
        format.html { render :new }
        format.json { render json: @placement_exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /placement_exams/1
  # PATCH/PUT /placement_exams/1.json
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

  # DELETE /placement_exams/1
  # DELETE /placement_exams/1.json
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
  # Use callbacks to share common setup or constraints between actions.
  def set_placement_exam
    @placement_exam = PlacementExam.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def placement_exam_params
    params.require(:placement_exam).permit(:question_type_id, :timeperiod, :start_date, :end_date, :company_id)
  end
end
