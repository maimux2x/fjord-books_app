# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def create
    @user.image.attach(params[:user][:image])
  end
end
