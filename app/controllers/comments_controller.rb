# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable, only: %i[create edit update destroy]
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @commentable.comments.new(comments_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      set_show_resource
      render show_path
    end
  end

  def edit; end

  def update
    if @comment.user_id != current_user.id
      head :forbidden 
      return
    end
    if @comment.update(comments_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    if @comment.user_id != current_user.id
      head :forbidden 
      return
    end
        
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:description, :user_id)
  end
end
