# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_comment_form
    render partial: 'comments/comment_form', locals: { commentable: @commentable, comment: @comment }
  end
end
