require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  def test_should_show_article
    get :show, :id => articles(:one).id
    assert_response :success
  end
end
