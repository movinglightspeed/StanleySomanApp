class PostsController < ApplicationController

  http_basic_authenticate_with name: "brad", password:"1234", except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end
  #from the post model we want to call find
  #to get that single post
  #show doesn't have a view, let's create that


#Doesn't know what @post is so we defined it in new page
  def new
    @post = Post.new
  end

  def create
    #render plain: params[:post].inspect
    @post = Post.new(post_params)
    #represents the model ^ , post_params is the name of the method


    #save method
    if(@post.save)
    redirect_to @post
    else
    render 'new'
    end
    #will redirect to showview
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if(@post.update(post_params))
    redirect_to @post
    else
    render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end


  #Forbidden attribute b/c special fields that a post is allowed to have isn't defined
  #To do that create method private
  #only can be accessed by this class
  private def post_params
    params.require(:post).permit(:title, :body)
  end

end
