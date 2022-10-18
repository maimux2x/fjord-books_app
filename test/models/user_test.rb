# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:alice)
    @other_user = users(:bob)
  end

  test 'user_should_have_email_or_name' do
    test_user = User.new(email: 'test@example.com', name: '')
    assert_equal 'test@example.com', test_user.name_or_email

    test_user.name = 'Test Test'
    assert_equal 'Test Test', test_user.name_or_email
  end

  test 'user_should_follow_otoher_user' do
    assert_difference '@other_user.followers.count', 1 do
      @user.follow(@other_user)
    end
  end

  test 'user_should_unfollow_otoher_user' do
    @user.follow(@other_user)

    assert_difference '@other_user.followers.count', -1 do
      @user.unfollow(@other_user)
    end
  end
end
