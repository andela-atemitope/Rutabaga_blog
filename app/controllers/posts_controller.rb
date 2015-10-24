class PostsController < ApplicationController
  def index
    @post = Post.all.order("created_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    # title = params[:post][:title]
    #   body = params[:post][:body]
    #   @post = [title, body]
    @post = Post.new(post_params)

    if @post.save

      redirect_to @post    
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
      # params[:post][:title]

    end


end
