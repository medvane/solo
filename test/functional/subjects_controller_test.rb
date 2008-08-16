require 'test_helper'

class SubjectsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:subjects)
  end

  def test_should_show_subject
    get :show, :id => subjects(:one).id
    assert_response :success
  end
end
