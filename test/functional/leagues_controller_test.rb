require File.dirname(__FILE__) + '/../test_helper'

class LeaguesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:leagues)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_league
    assert_difference('League.count') do
      post :create, :league => { }
    end

    assert_redirected_to league_path(assigns(:league))
  end

  def test_should_show_league
    get :show, :id => leagues(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => leagues(:one).id
    assert_response :success
  end

  def test_should_update_league
    put :update, :id => leagues(:one).id, :league => { }
    assert_redirected_to league_path(assigns(:league))
  end

  def test_should_destroy_league
    assert_difference('League.count', -1) do
      delete :destroy, :id => leagues(:one).id
    end

    assert_redirected_to leagues_path
  end
end
