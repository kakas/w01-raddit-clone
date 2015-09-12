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
    @link = Link.new(link_params)

    if @link.save
      redirect_to root_path, notice: "Adds link successful"
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])

    if @link.update(link_params)
      redirect_to root_path, notice: "Edits link successful"
    else
      render :edit
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy
    redirect_to root_path, alert: "link has been deleted"
  end

  private

    def link_params
      params.require(:link).permit(:title, :url)
    end

end
