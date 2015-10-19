class VideosController < ApplicationController

  def index
    if params[:search]
      @videos = Video.includes(:tags).where('tags.name' => params[:search]).all
    else
      @videos = Video.all
    end
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:notice] = 'Video added!'
      redirect_to videos_path
    else
      render[:new]
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = 'Video deleted!'
    redirect_to videos_path
  end

  def video_params
    params.require(:video).permit(:link)
  end

end
