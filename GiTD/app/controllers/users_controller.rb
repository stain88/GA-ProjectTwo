class UsersController < ApplicationController
  before_action :set_user, only:[:show]
  before_action :get_counts, only:[:index]

  def index
    if current_user
      case params[:people]
      when "friends"
        @users = current_user.active_friends
      when "requests"
        @users = current_user.pending_friend_requests_from.map(&:user)
      when "pending"
        @users = current_user.pending_friend_requests_to.map(&:friend)
      else
        @users = User.where.not(id: current_user.id)
      end
    else
      @users = User.all
    end
  end
  
  def show
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
