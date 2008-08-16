require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:authors)
  end

  def test_should_show_author
    get :show, :id => authors(:one).id
    assert_response :success
  end
end
