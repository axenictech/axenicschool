class NewscastsController < ApplicationController

  def new
    @newscast=Newscast.new
  end

  def select
    unless params[:newscast][:title].empty?
      @newscasts=Newscast.where("title like '#{params[:newscast][:title]}%'")
    end
  end
	
	def create
	 @newscast =Newscast.new(newscast_params)
    if @newscast.save
	   redirect_to newscast_path(@newscast), notice: "News added successfully"
      else
      render 'new'
    end
  end

  def edit
    @newscast = Newscast.find(params[:id])
  end

  def update
  	@newscast=Newscast.find(params[:id])
  	if @newscast.update(newscast_params)
  	redirect_to newscast_path(@newscast), notice: "News updated successfully!!!"
    else
      render 'edit'
    end
  end

  def destroy
   @newscast = Newscast.find(params[:id])
  	@newscast.destroy
   	redirect_to newscasts_path(@newscast), notice: "News deleted succefully!"
  end

  def show
  	@newscast = Newscast.find(params[:id])
    @comment = @newscast.comments.new
  end

  def display
    @newscasts = Newscast.order(created_at: :desc)
  end

  private
  def newscast_params
    params.require(:newscast).permit(:title, :content)
  end
end
