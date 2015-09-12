class CommentsController < ApplicationController

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.build(comment_params)

    if @comment.save
      redirect_to link_path(@link), notice: "adds new comment sucess"
    else
      render "links/show"
    end
  end

  def destroy
    @link = Link.find(params[:link_id])
    @comment = @link.comments.find(params[:id])

    @comment.destroy
    redirect_to link_path(@link), alert: "comment deleted"
  end

  private

    def comment_params
      params.require(:comment).permit(:content)
    end

end
