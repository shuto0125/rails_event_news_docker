class Events::PostsController < ApplicationController
  skip_before_action :authenticate, only: :show

  def new
    @event_name = Event.find(params[:event_id]).name
    @post = current_user.created_posts.build
  end

  def create
    @post = current_user.created_posts.build(post_params)

    if @post.save
      redirect_to @post.event, notice: "投稿しました"
    end
  end

  def destroy
    @post = current_user.created_posts.find(params[:id])
    if @post.destroy!
      redirect_to @post.event, notice: "イベントのポストを削除しました"
    end
  end

  private

  def post_params
    params.permit( :title, :content, :event_id)
  end

end
