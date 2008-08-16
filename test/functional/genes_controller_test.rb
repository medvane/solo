require 'test_helper'

class GenesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:genes)
  end

  def test_should_show_gene
    get :show, :id => genes(:one).id
    assert_response :success
  end
end
