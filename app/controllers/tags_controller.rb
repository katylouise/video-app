class TagsController < ApplicationController
  def new
    @video = Video.find(params[:video_id])
    @tag = Tag.new
  end

  def create
    @video = Video.find(params[:video_id])
    @tag = @video.tags.create(tag_params)
    redirect_to videos_path
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
