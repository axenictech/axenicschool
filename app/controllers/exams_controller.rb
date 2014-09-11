class ExamsController < ApplicationController
	def new
		@exam_group=ExamGroup.find(params[:format])
		@batch=@exam_group.batch
		@subjects=@batch.subjects.all
		@exam=@exam_group.exams.build
	end 

	def create
		@exam_group=ExamGroup.find(params[:exam_group_id])
		@exam=@exam_group.exams.new(exam_params)
		if @exam.save 
			flash[:notice_exam]='created successfully'
			redirect_to exam_groups_exam_show_path(@exam.exam_group)
		else
			render 'new'
		end
	end

	private
	def exam_params
		params.require(:exam).permit(:subject_id,:start_time,:end_time,:maximum_marks,:minimum_marks)
	end

end
