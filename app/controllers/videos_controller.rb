class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new

  end

  def create
    Video.create(video_params)
    redirect_to videos_path
  end

  def video_params
    params.require(:video).permit(:link, :title)
  end
end
