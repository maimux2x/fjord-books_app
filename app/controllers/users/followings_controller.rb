# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @title = t('views.users.show_following')
    @user = User.find(params[:user_id])
    @users = @user.following
    render 'users/show_follow'
  end
end
