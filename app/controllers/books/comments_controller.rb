# frozen_string_literal: true

class Books::CommentsController < CommentsController
  private

  def set_commentable
    @commentable = Book.find(params[:book_id])
  end

  def set_comment_form
    render partial: 'comments/comment_form', locals: { commentable: @commentable, comment: @comment }
  end
end
