class CommentsController < ApplicationController

  before_action :authenticate_user!

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.author = current_user


    if @comment.save
      redirect_to link_path(@link), notice: "adds new comment sucess"
    else
      render "links/show"
    end
  end

  def destroy
    @link = Link.find(params[:link_id])
    @comment = current_user.comments.find(params[:id])

    @comment.destroy
    redirect_to link_path(@link), alert: "comment deleted"
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
