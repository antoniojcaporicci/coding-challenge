class PostsController < ApplicationController
  def index
    # Return all `Post`
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at DESC")
    else
      @posts = Post.all.order('created_at DESC')
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # Return view to create a new Post
    @post = Post.new
  end

  def create
    # Add a new `Post` to the database
    @post = Post.new(post_params)
  
    @post.save
    redirect_to @post
  end


  def destroy
    # Remove a `Post` from the database
    @post = Post.find(params[:id])
    @post.destroy
    
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
