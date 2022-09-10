# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @title = t('views.users.show_followed')
    @user = User.find(params[:user_id])
    @users = @user.followers
    render 'users/show_follow'
  end
end
