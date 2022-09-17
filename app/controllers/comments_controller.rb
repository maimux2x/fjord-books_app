# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def create
    @comment = @commentable.comments.new(comments_params)
    if @comment.save
      flash[:success] = 'Comment created!'
      redirect_to @commentable
    else
      render @commentable
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @comment.update(comments_params)
        format.html { redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comments_params
    params.require(:comment).permit(:description, :user_id)
  end
end
