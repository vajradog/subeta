class VideosController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]


def index
  @videos = Video.order('created_at DESC')
end
def new
  @video = Video.new
end
 
def create
  @video = Video.new(video_params)
  if @video.save
    flash[:success] = 'Video added!'
    redirect_to root_url
  else
    render 'new'
  end
end

def show
	@video = Video.find(params[:id])
  @category = @video.category(@video)
  @videos = @category.videos.all
end

def edit
   @video = Video.find(params[:id]) 
    
  end

  def update
    @video = Video.find(params[:id])  
    if @video.update(video_params)
      flash[:notice] = "Video title updated"
      redirect_to video_path
    else
      flash[:error] = "Video title could not be updated"
      render 'edit'
    end
  end

  private

def video_params
	params.require(:video).permit(:link, :uid, :description, :title, :author, :duration, :likes, :dislikes, :category_id)#, :new_category_name)
end

end