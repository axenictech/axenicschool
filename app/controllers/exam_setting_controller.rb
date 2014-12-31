# exam setting controller
class ExamSettingController < ApplicationController
  def index
    authorize! :read, GradingLevel
  end

  def new
    @courses ||= Course.all
    authorize! :read, ClassDesignation
  end

  def newrank
    @courses ||= Course.all
    authorize! :read, RankingLevel
  end

  def setting
    @course = Course.find(params[:id])
    @class_des = ClassDesignation.new
    @class_dess ||= @course.class_designations.all
    @class_des1 = @course.class_designations.build
    authorize! :create, @class_des
  end

  def settingrank
    @course = Course.find(params[:id])
    @rank_lev = RankingLevel.new
    @rank_levels ||= @course.ranking_levels.all
    @rank_lev1 = @course.ranking_levels.build
    authorize! :create, @rank_lev
  end

  def create
    @course = Course.find(params[:id])
    @class_dess ||= @course.class_designations.all
    @class_des1 = @course.class_designations.new(params_class)
    if @class_des1.save
      flash[:notice] = t('create_class')
    else
      flash[:notice] = t('not_create_class')
    end
  end

  def createrank
    @course = Course.find(params[:course_id])
    @rank_levels = @course.ranking_levels.order('prioriy ASC')
    @rank_lev1 = @course.ranking_levels.new(params_rank)
    @max_rank = RankingLevel.maximum('prioriy')
    if @max_rank.nil?
      @max_rank = 0.to_i
    end
    @rank_lev1.prioriy = @max_rank + 1.to_i
    if @rank_lev1.save
      flash[:notice] = t('create_rank')
    else
      flash[:notice] = t('not_create_rank')
      render 'newrank'
    end
  end

  def increase_priority
    @course = Course.find(params[:id])
    @rank_levels = @course.ranking_levels.order('prioriy ASC')
    @rank_lev1 = @course.ranking_levels.find(params[:id])
    selected = params[:index].to_i - 1.to_i
    previous = 0.to_i
    temp = nil
    @rank_levels.each do |p|
      if (selected == previous)
        temp = p
      end
      if (selected + 1.to_i == previous)
        current = p.prioriy
        prev_pri = temp.prioriy
        p.update(prioriy: nil)
        temp.update(prioriy: current)
        p.update(prioriy: prev_pri)
      end
      previous = previous + 1.to_i
    end
    @rank_levels = @course.ranking_levels.order('prioriy ASC')
    authorize! :create, @rank_lev1
  end

  def decrease_priority
    @course = Course.find(params[:id])
    @rank_levels = @course.ranking_levels.order('prioriy ASC')
    @rank_lev1 = @course.ranking_levels.find(params[:id])
    selected = params[:index].to_i + 1.to_i
    next_pri = 0.to_i
    temp = nil
    #@course.decrease_order(@rank_levels,selected,next_pri,temp)
    @rank_levels.each do |p|
      if (selected - 1.to_i == next_pri)
        temp = p
      end
      if (selected == next_pri)
        current = p.prioriy
        next_priority = temp.prioriy
        p.update(prioriy: nil)
        temp.update(prioriy: current)
        p.update(prioriy: next_priority)
      end
        next_pri = next_pri + 1.to_i
    end
    @rank_levels = @course.ranking_levels.order('prioriy ASC')
    authorize! :create, @rank_lev1
  end

  def destroy
    authorize! :delete, @class_des1
    @course = Course.find(params[:course_id])
    @class_dess ||= @course.class_designations.all
    @class_des1 = @course.class_designations.find(params[:id])
    if @class_des1.destroy
      flash[:notice] = t('del_class')
    else
      flash[:notice] = t('not_del_class')
    end
  end

  def destroyRank
    authorize! :delete, @ranking_levels
    @rank_lev1 = RankingLevel.find(params[:id])
    @course = @rank_lev1.course
    @rank_levels = @course.ranking_levels.order('prioriy ASC')
    if @rank_lev1.destroy
      flash[:notice] = t('del_rank')
    else
      flash[:notice] = t('not_del_rank')
      render 'newrank'
    end
  end
  def edit
    @course = Course.find(params[:id])
    @class_des1 = @course.class_designations.find(params[:class_des])
    authorize! :update, @class_des1
  end

  def update
    @course = Course.find(params[:course_id])
    @class_dess ||= @course.class_designations.all
    @class_des1 = @course.class_designations.find(params[:class_des])
    if @class_des1.update(params_class)
      flash[:notice] = t('update_class')
    else
      flash[:notice] = t('not_update_class')
    end
  end

  def editRank
    @course = Course.find(params[:id])
    @rank_lev1 = @course.ranking_levels.find(params[:course_id])

    @course = Course.find(params[:id])
    @rank_lev1 = @course.ranking_levels.find(params[:course_id])
    authorize! :update, @rank_lev1
  end

  def updateRank
    @course = Course.find(params[:course_id])
    @rank_levels = @course.ranking_levels.order('prioriy ASC')
    @rank_lev1 = @course.ranking_levels.find(params[:id])
    if @rank_lev1.update(params_rank)
      flash[:notice] = t('update_rank')
    else
      flash[:notice] = t('not_update_rank')
    end
  end

  def select
    @course = Course.find(params[:course][:id])
    @class_dess ||= @course.class_designations.all
    authorize! :read, @class_dess.first
  end

  def selectrank
    @course = Course.find(params[:course][:id])
    @rank_levels = @course.ranking_levels.order('prioriy ASC')
    # authorize! :read, @ranking_levels.first
  end

  private

  def params_class
    params.require(:class_designation).permit(:name, :marks)
  end

  private

  def params_rank
    params.require(:ranking_level).permit(:name, :marks, :marks_limit_type, :subject_limit_type, :subject_count, :full_course, :prioriy)
  end
end