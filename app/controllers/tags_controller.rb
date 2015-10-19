class TagsController < ApplicationController

  def new
    @video = Video.find(params[:video_id])
    @tag = Tag.new
  end

  def create
    @video = Video.find(params[:video_id])
    name_array = tag_params[:name].split(" ")
    name_array.each do |name|
      @tag = @video.tags.create(name: name)
    end
    redirect_to videos_path
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
