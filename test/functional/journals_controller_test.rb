require 'test_helper'

class JournalsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:journals)
  end

  def test_should_show_journal
    get :show, :id => journals(:one).id
    assert_response :success
  end
end
