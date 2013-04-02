class PostsController < ApplicationController

  before_filter :connected, :redirection, except: [:index, :show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(post_id: @post.id).order(:created_at)
    

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    if session[:user_id] != @post.user.id
      @post = nil
      redirect_to(root_path, notice: "This is not your post, so please don't try to edit it.")
    end
    
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
    @post.user_id = session[:user_id]

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    if session[:user_id] != @post.user.id
      redirect_to(root_path, notice: "It's bad to delete something that's not yours.")
    else
      @post.destroy

      respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
      end
    end
   
  end
end
