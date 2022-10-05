# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  private

  def set_commentable
    @commentable = Report.find(params[:report_id])
  end

  def set_show_resource
    @report = @commentable
  end

  def show_path
    "/reports/show"
  end
end
