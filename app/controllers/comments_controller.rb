class CommentsController < ApplicationController

	def create
    @newscast = Newscast.find(params[:newscast_id])
    @comment = @newscast.comments.new(comment_params)
      if @comment.save
        redirect_to newscast_path(@newscast)
      else
        render template:'newscasts/show'
      end
  end


  def destroy
     @newscast = Newscast.find(params[:newscast_id])
    @comment = @newscast.comments.find(params[:id])
    @comment.destroy
    redirect_to newscast_path(@newscast)
  end


 
  private
    def comment_params
      params.require(:comment).permit(:statement)
    end
end


