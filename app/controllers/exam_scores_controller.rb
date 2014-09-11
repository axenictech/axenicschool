class ExamScoresController < ApplicationController
  def index
  end

  def new
  	@exam=Exam.find(params[:exam_id])
  	@batch=@exam.exam_group.batch
  	@students=@batch.students.all
  	@exam_score=@exam.exam_scores.build
  	
  end
	def create
		
	end

end
