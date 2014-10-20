class ExamsController < ApplicationController
	def new
		@exam_group=ExamGroup.find(params[:format])
		@batch=@exam_group.batch
		@subjects=@batch.subjects.where(no_exams:false)
		@exam=@exam_group.exams.build
	end 

	def create
		@exam_group=ExamGroup.find(params[:exam_group_id])
		@batch=@exam_group.batch
		@subjects=@batch.subjects.where(no_exams:false)
		@exam=@exam_group.exams.new(params_exam)
		if @exam.save 
			flash[:notice_exam]='created successfully'
			redirect_to exam_groups_exams_path(@exam.exam_group)
		else
			render 'new'
		end
	end

	def edit
		@exam=Exam.find(params[:id])
		@exam_group=@exam.exam_group
		@batch=@exam.exam_group.batch
		@subjects=@batch.subjects.where(no_exams:false)
	end

	def update
		@exam=Exam.find(params[:id])
		if @exam.update(params_exam)
			flash[:notice_exam]='updated successfully'
			redirect_to exam_groups_exams_path(@exam.exam_group)
		else
			render 'edit'
		end
	end

	def exam_score

	  	@exam=Exam.find(params[:id])


	  	@students=[]
	    students=@exam.exam_group.batch.students.all
	    unless students.nil?
		    students.each do |std|
		    	unless @exam.subject.elective_group.nil?
			    	is_elective=StudentSubject.find_by_student_id_and_subject_id(std.id,@exam.subject_id)
			    	unless is_elective.nil?
			    	@students<<std
			   		end
			   	else
			   		@students<<std
			   	end
		   	end
		end
		@exam_grade=@exam.exam_group.batch.grading_levels.all
		
	end

	def update_exam_score
		@exam=Exam.find(params[:id])
		@exam_group=@exam.exam_group
		@batch=@exam_group.batch
		grades=@exam.exam_group.batch.grading_levels.order(min_score: :asc)
		params[:exams][:exam].each_pair do |student_id, details|
      	@exam_score=ExamScore.find_by_exam_id_and_student_id(@exam.id,student_id)
      	@grouped_exam=GroupedExamReport.find_by_batch_id_and_student_id_and_exam_group_id_and_subject_id(@batch.id,student_id,@exam_group.id,@exam.subject_id)
      	score_grade=""
      	fail=false
      	fail=true if details[:marks].to_f<@exam.minimum_marks.to_f
			
			unless @exam.exam_group.exam_type=="Marks"
				unless @exam.exam_group.exam_type=="Grades"
					percentage=(details[:marks].to_f*100)/@exam.maximum_marks.to_f
					grades.each do |grade|
						if percentage>=grade.min_score
							score_grade=grade.id
						end
					end
				else
					grades.each do |grade|
						if details[:marks].to_f>=grade.min_score
							score_grade=grade.id
						end
					end
				end
			end
			
      		if @exam_score.nil?
		        exam_score=ExamScore.new(exam_id:@exam.id,student_id:student_id,
		        	marks:details[:marks],remarks:details[:remarks],grading_level_id:score_grade,is_failed:fail)
  				unless exam_score.save
  					@errors=exam_score.errors.full_messages
  				end
      		else
		        unless @exam_score.update(marks:details[:marks],remarks:details[:remarks],grading_level_id:score_grade,is_failed:fail)
		        	@errors=@exam_score.errors.full_messages
		        end	
	        end
	    if @errors.nil?
	   		if @grouped_exam.nil?
	        GroupedExamReport.create(batch_id:@batch.id,student_id:student_id,
		        	exam_group_id:@exam_group.id,subject_id:@exam.subject_id,marks:details[:marks])
	    	else
	       	@grouped_exam.update(marks:details[:marks])
	    	end
	   	end 	
    end
    if @errors.nil?
    	redirect_to exam_exam_score_path(@exam)
    else
    	@students=[]
	    students=@exam.exam_group.batch.students.all
	    unless students.nil?
		    students.each do |std|
		    	unless @exam.subject.elective_group.nil?
			    	is_elective=StudentSubject.find_by_student_id_and_subject_id(std.id,@exam.subject_id)
			    	unless is_elective.nil?
			    	@students<<std
			   		end
			   	else
			   		@students<<std
			   	end
		   	end
		end
		@exam_grade=@exam.exam_group.batch.grading_levels.all					
    	render 'exam_score'
    end
	end

    def destroy
    	@exam=Exam.find(params[:id])
	    @exam.destroy
	    redirect_to exam_groups_exams_path(@exam.exam_group)
    end

	private
	def params_exam
    	params.require(:exam).permit(:subject_id,:start_time,:end_time,:maximum_marks,
    		       :minimum_marks)
	end
end
