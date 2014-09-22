class ExamsController < ApplicationController
	def new
		@exam_group=ExamGroup.find(params[:format])
		@batch=@exam_group.batch
		@subjects=@batch.subjects.all
		@exam=@exam_group.exams.build
	end 

	def create
		@exam_group=ExamGroup.find(params[:exam_group_id])
		@exam=@exam_group.exams.new(params_exam)
		if @exam.save 
			flash[:notice_exam]='created successfully'
			redirect_to exam_groups_exams_path(@exam.exam_group)
		else
			render 'new'
		end
	end

	def exam_score
	  	@exam=Exam.find(params[:id])
	    @students=@exam.exam_group.batch.students.all
	end

	def update
		@exam=Exam.find(params[:id])
		
		params[:exams][:exam].each_pair do |student_id, details|
      	@exam_score=ExamScore.find_by_exam_id_and_student_id(@exam.id,student_id)
      		if @exam_score.nil?
		        ExamScore.create(exam_id:@exam.id,student_id:student_id,
		        	marks:details[:marks],remarks:details[:remarks])
      		else
		        @exam_score.update(marks:details[:marks],remarks:details[:remarks])
	        end
    	end
    	redirect_to exam_groups_exams_path(@exam.exam_group)
    end

	private
	def params_exam
    	params.require(:exam).permit(:subject_id,:start_time,:end_time,:maximum_marks,
    		       :minimum_marks)
	end
end
