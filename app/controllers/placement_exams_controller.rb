# PlacementExamsController
class PlacementExamsController < ApplicationController
  before_action :set_placement_exam, only: [:show, :edit, :update, :destroy]

  def index
    @placement_news = PlacementNews.all
    @placement_exams = PlacementExam.all
  end

  def insert
    @companies = Company.all
    @placement_news = PlacementNews.all
  end

  def apply_exam
    @companies = Company.all
    @placement_news = PlacementNews.all
  end

  def create_exam
    @exam = PlacementExam.new
    @company = Company.all
    @placement_exam = PlacementExam.new
  end

  def insert_exam
    question_type = params[:question_type]
    percentage = params[:percentages]
    if percentage.map(&:to_i).sum == 100
      @placement_exam = PlacementExam.new(placement_exam_params)
      @placement_exam.save
      i = 0
      question_type.each do |q|
        Weightage.create(question_type_id: q,placement_exam_id: @placement_exam.id, percentage: percentage[i])
        i += 1
      end
      redirect_to create_exam_placement_exams_path
      flash[:notice] = t('placement_exam_created')
    else
      render 'create_exam'
      flash[:alert] = t('placement_exam_error')
    end
  end

  def question_paper
    @placement_exam = PlacementExam.find(params[:format])
    @company = Company.find(@placement_exam.company_id)
    @questions = QuestionDatabase.all
  end

  def save_test
    @test = params[:question]
    StudentExam.create(placement_exams_id: params["placement_exam_id"], students_id: params["student_id"])
    @student_exam = StudentExam.last
    i=0
    @test.each do |t|
      StudentAnswerSheet.create(student_exams_id: @student_exam.id ,question_databases_id: t[0],options_id: t[1])
      @ans = Option.where(question_database_id: t[0].to_i,id: t[1].to_i).take
      if @ans.is_answer==true
        i+=1
      else  
      end
    end
    StudentScore.create(placement_exams_id: params["placement_exam_id"], students_id: params["student_id"],score: i.to_f)
    @score = StudentScore.last
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

  def disp_time
    @placement_exam = PlacementExam.first
    @time = @placement_exam.timeperiod.strftime("%M").to_i
  end

  private

  def set_placement_exam
    @placement_exam = PlacementExam.find(params[:id])
  end

  def placement_exam_params
    params.require(:exam).permit!
  end

  def save_test_params
    params.require(:question).permit!
  end
end
