class PostsController < ApplicationController
  before_action :set_post, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit update destroy ]
  before_action :authorize_post, only: %i[ edit update destroy ]
  layout "post"

  # GET /posts or /posts.json
  def index
    @q = Post.published_or_owned_by(current_user).ransack(params[:q])
    @pagy, @posts = pagy(@q.result, limit: ApplicationRecord::DEFAULT_PAGING)
  end

  # GET /posts/1 or /posts/1.json
  def show
    @post = Post.includes(:user).find_by(id: params[:id])
    @pagy, @comments = pagy(@post.comments.includes(:user, :subordinates).order(:id), limit: ApplicationRecord::DEFAULT_PAGING)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy!

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by(id: params[:id])
      if @post.nil?
        flash[:alert] ="Post not found."
        redirect_to posts_path
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :content, :image, :status)
    end

    def authorize_post
      authorize @post
    end
end
