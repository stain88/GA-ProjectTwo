class UsersController < ApplicationController
  before_action :set_user, only:[:show]
  before_action :get_counts, only:[:index]

  def index
    if current_user
      @users = case params[:people]
      when "friends" then current_user.active_friends
      when "requests" then current_user.pending_friend_requests_from.map(&:user)
      when "pending" then current_user.pending_friend_requests_to.map(&:friend)
      else
        User.where.not(id: current_user.id)
      end
    else
      @users = User.all
    end
  end
  
  def show
    @comments = Commontator::Comment.where(creator_id: @user)
    @posts = Forem::Post.where(user_id: @user)
    @games = Game.where(user_id: @user)
    @activity = [@comments,@posts,@games].flatten.sort { |x,y| y.created_at <=> x.created_at }
  end

  private

  def set_user
    @user = User.find_by(username: params[:id])
  end
  
  def get_counts
    @friend_count = current_user.active_friends.size if current_user 
    @pending_count = current_user.pending_friend_requests_to.map(&:friend).size if current_user 
  end

end
