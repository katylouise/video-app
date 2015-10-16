class VideosController < ApplicationController

  def index
    @videos = Video.all
    @tags = Tag.all
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
