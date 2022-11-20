class PostsController < ApplicationController
  before_action :authenticate_user!, { only: [:new, :create, :edit, :update, :destroy] }
  before_action :ensure_correct_user, { only: [:edit, :update] }

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "投稿が完了しました。"
      redirect_to posts_path
    else
      render new_post_path
    end
  end

  def index
    @posts = Post.includes(user: { image_attachment: :blob }).order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @head_main = GearPower.find(@post.head_main)
    @head_sub1 = GearPower.find(@post.head_sub1)
    @head_sub2 = GearPower.find(@post.head_sub2)
    @head_sub3 = GearPower.find(@post.head_sub3)
    @body_main = GearPower.find(@post.body_main)
    @body_sub1 = GearPower.find(@post.body_sub1)
    @body_sub2 = GearPower.find(@post.body_sub2)
    @body_sub3 = GearPower.find(@post.body_sub3)
    @shoes_main = GearPower.find(@post.shoes_main)
    @shoes_sub1 = GearPower.find(@post.shoes_sub1)
    @shoes_sub2 = GearPower.find(@post.shoes_sub2)
    @shoes_sub3 = GearPower.find(@post.shoes_sub3)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "投稿を編集しました。"
      redirect_to post_path(@post)
    else
      flash.now[:alert] = "投稿の編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.user == current_user
      @post.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to posts_path
    else
      flash[:alert] = "投稿者としてログインしていない場合は削除できません。"
      redirect_to post_path(@post)
    end
  end

  def search
    @results = @q_post.result.includes(user: { image_attachment: :blob }).order(created_at: :desc)
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :weapon,
      :battle,
      :comment,
      :head_main,
      :head_sub1,
      :head_sub2,
      :head_sub3,
      :body_main,
      :body_sub1,
      :body_sub2,
      :body_sub3,
      :shoes_main,
      :shoes_sub1,
      :shoes_sub2,
      :shoes_sub3
    ).merge(user_id: current_user.id)
  end

  def ensure_correct_user
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      flash[:alert] = "権限がありません。編集を行うには、投稿者としてログインする必要があります。"
      redirect_to posts_path
    end
  end
end
