class ExamSettingController < ApplicationController
    def index
    end
  
    def new
      @courses=Course.all
    end

    def newrank
      @courses=Course.all
    end

    def setting
    	@course=Course.find(params[:course_id])
	    @class_des = ClassDesignation.new
      @class_dess=@course.class_designations.all
	    @class_des1=@course.class_designations.build
    end

    def settingrank
       @course=Course.find(params[:course_id])
       @rank_lev=RankingLevel.new
       @rank_levels=@course.ranking_levels.all
       @rank_lev1=@course.ranking_levels.build
    end

    def create
      @course=Course.find(params[:course_id])
      @class_dess=@course.class_designations.all
      @class_des1=@course.class_designations.new(params_class)
      @class_des1.save
    end

    def createrank
      @course=Course.find(params[:course_id])
      @rank_levels=@course.ranking_levels.all
      @rank_lev1=@course.ranking_levels.new(params_rank)
      @rank_lev1.save
    end


    def destroy
        @course=Course.find(params[:course_id])
        @class_dess=@course.class_designations.all
        @class_des1=@course.class_designations.find(params[:id])
        @class_des1.destroy
    end

    def destroyRank
      
       @rank_lev1=RankingLevel.find(params[:id])
       @course=@rank_lev1.course
       @rank_levels=@course.ranking_levels.all
       @rank_lev1.destroy
    end

    def edit
        @course=Course.find(params[:course_id])
        @class_des1=@course.class_designations.find(params[:id])
    end

    def update
        @course=Course.find(params[:course_id])
        @class_dess=@course.class_designations.all
         @class_des1=@course.class_designations.find(params[:id])
        @class_des1.update(params_class)
    end

    def editRank
        @course=Course.find(params[:course_id])
        @rank_lev1=@course.ranking_levels.find(params[:id])
    end

    def updateRank
      @course=Course.find(params[:course_id])
      @rank_levels=@course.ranking_levels.all
      @rank_lev1=@course.ranking_levels.find(params[:id])
      @rank_lev1.update(params_rank)
    end

    def select
        @course=Course.find(params[:course][:id])
        @class_dess=@course.class_designations.all
    end

    def selectrank
        @course=Course.find(params[:course][:id])
       @rank_levels=@course.ranking_levels.all
         # @course=Course.find(params[:course_id]
    end
    
    private
    def params_class
      params.require(:class_designation).permit(:name,:marks)
    end

    private
    def params_rank
      params.require(:ranking_level).permit(:name,:marks,:marks_limit_type,:subject_limit_type,:subject_count,:full_course)
    end

end
