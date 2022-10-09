# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  def setup
    @user = users(:alice)
    @report = reports(:one)
    @other_report = reports(:two)
  end

  test 'user_should_edit_own_report' do
    assert_not @other_report.editable?(@user)
    assert @report.editable?(@user)
  end

  test 'created_at_should_convert_date' do
    assert @report.created_on
  end
end
