class PostsController < ApplicationController
  before_action :authenticate_user!, { only: [:new, :create, :edit, :update, :destroy] }

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
    @posts = Post.all.order(created_at: :desc)
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
  end

  def update
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
end
