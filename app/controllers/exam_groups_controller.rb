class ExamGroupsController < ApplicationController
  def index

  end
  def select
    @course=Course.find(params[:course][:id])
    @batches=@course.batches.all
  end

  def new
    @batch=Batch.find(params[:format])
    @exam_group=@batch.exam_groups.build
    
  end

  def create
    @batch=Batch.find(params[:format])
    @exam_group=@batch.exam_groups.new(paramexam)
    @exam_group.save
    @subjects=@batch.subjects.all

  end


  private 
  def paramexam
    params.require(:exam_group).permit(:name,:exam_type)
  end

end
  