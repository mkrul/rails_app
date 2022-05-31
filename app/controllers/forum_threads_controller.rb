require 'byebug'

class ForumThreadsController < ApplicationController
  before_action :authenticate_user!, except: %i(index show)
  before_action :set_forum_thread, except: %i(index new create)

  def index
    @forum_threads = ForumThread.all
  end

  def show
  end

  def new
    @forum_thread = ForumThread.new
    @forum_thread.forum_posts.new
  end

  def create
    @forum_thread = current_user.forum_threads.new forum_thread_params
    @forum_thread.forum_posts.first.user_id = current_user.id

    if @forum_thread.save
      redirect_to @forum_thread
    else
      render action: :new
    end
  end

  def update
    @forum_thread.update(forum_thread_params)

    render action: :show
  end

  private

  def set_forum_thread
    @forum_thread = ForumThread.find(params[:id])
  end

  def forum_thread_params
    params.require(:forum_thread).permit(:subject, forum_posts_attributes: %i(id body))
  end
end