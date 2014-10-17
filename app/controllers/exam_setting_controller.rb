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
     if @class_des1.save
      flash[:class_designation_notice]="Class Designation Created Successfully"
     else 
       flash[:class_designation_notice]="Class Designation Not Created Successfully"
    end
   end
    def createrank
      @course=Course.find(params[:course_id])
      @rank_levels=@course.ranking_levels.all
      @rank_lev1=@course.ranking_levels.new(params_rank)
      if @rank_lev1.save 
<<<<<<< HEAD
       flash[:ranking_level_notice]="RankingLevel Created Successfully"
       else
          flash[:ranking_level_notice]="RankingLevel Not Created Successfully"
         # render 'newrank'
       end
=======
         flash[:ranking_level_notice]="RankingLevel Created Successfully"
      else
         flash[:ranking_level_notice]="RankingLevel not Created Successfully"
         render 'newrank'
      end
>>>>>>> fbfb561eb57e695ff70384d0d18cd06c9b73263b
    end


    def destroy
        @course=Course.find(params[:course_id])
        @class_dess=@course.class_designations.all
        @class_des1=@course.class_designations.find(params[:id])
<<<<<<< HEAD
       if @class_des1.destroy
        flash[:class_designation_notice]="Class Designation Deleted Successfully"
      else 
        flash[:class_designation_notice]="Class Designation Not Deleted Successfully"
      end
   end
=======
        @class_des1.destroy
      #    flash[:ranking_level_notice]="RankingLevel Deleted Successfully"
      #   else
      #    flash[:ranking_level_notice]="RankingLevel not Deleted Successfully"
      #   render 'newrank'
      # end

    end
>>>>>>> fbfb561eb57e695ff70384d0d18cd06c9b73263b

    def destroyRank
      
       @rank_lev1=RankingLevel.find(params[:id])
       @course=@rank_lev1.course
       @rank_levels=@course.ranking_levels.all
       if @rank_lev1.destroy
         flash[:ranking_level_notice]="RankingLevel Deleted Successfully"
       else
         flash[:ranking_level_notice]="RankingLevel not Deleted Successfully"
         render 'newrank'
      end
    end

    def edit
        @course=Course.find(params[:course_id])
        @class_des1=@course.class_designations.find(params[:id])
    end

    def update
        @course=Course.find(params[:course_id])
        @class_dess=@course.class_designations.all
         @class_des1=@course.class_designations.find(params[:id])
        if @class_des1.update(params_class)
          flash[:class_designation_notice]="Class Designation Updated Successfully"
        else 
         flash[:class_designation_notice]="Class Designation Not Updated Successfully"
        end
    end
    def editRank
        @course=Course.find(params[:course_id])
        @rank_lev1=@course.ranking_levels.find(params[:id])
    end

    def updateRank
      @course=Course.find(params[:course_id])
      @rank_levels=@course.ranking_levels.all
      @rank_lev1=@course.ranking_levels.find(params[:id])
     if @rank_lev1.update(params_rank)
       flash[:ranking_level_notice]="Ranking Level Updated Successfully"
        else 
         flash[:ranking_level_notice]="Ranking Level Designation Not Updated Successfully"
        end
    end

    def select
        @course=Course.find(params[:course][:id])
        @class_dess=@course.class_designations.all
    end

    def selectrank
        @course=Course.find(params[:course][:id])
       @rank_levels=@course.ranking_levels.all
         
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
