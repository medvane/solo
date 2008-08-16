require 'test_helper'

class PubtypesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pubtypes)
  end

  def test_should_show_pubtype
    get :show, :id => pubtypes(:one).id
    assert_response :success
  end
end
