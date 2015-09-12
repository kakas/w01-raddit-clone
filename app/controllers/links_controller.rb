class LinksController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]


  def index
    @links = Link.all
  end

  def show
    @link = Link.includes(:comments).find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)

    if @link.save
      redirect_to root_path, notice: "Adds link successful"
    else
      render :new
    end
  end

  def edit
    @link = current_user.links.find(params[:id])
  end

  def update
    @link = current_user.links.find(params[:id])

    if @link.update(link_params)
      redirect_to root_path, notice: "Edits link successful"
    else
      render :edit
    end
  end

  def destroy
    @link = current_user.links.find(params[:id])
    @link.destroy
    redirect_to root_path, alert: "link has been deleted"
  end

  def upvote
    @link = Link.find(params[:id])
    @link.liked_by current_user
    redirect_to :back
  end

  def downvote
    @link = Link.find(params[:id])
    @link.downvote_from current_user
    redirect_to :back
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

end
