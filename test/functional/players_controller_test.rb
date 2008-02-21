require File.dirname(__FILE__) + '/../test_helper'

class PlayersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:players)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_player
    assert_difference('Player.count') do
      post :create, :player => { }
    end

    assert_redirected_to player_path(assigns(:player))
  end

  def test_should_show_player
    get :show, :id => players(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => players(:one).id
    assert_response :success
  end

  def test_should_update_player
    put :update, :id => players(:one).id, :player => { }
    assert_redirected_to player_path(assigns(:player))
  end

  def test_should_destroy_player
    assert_difference('Player.count', -1) do
      delete :destroy, :id => players(:one).id
    end

    assert_redirected_to players_path
  end
end
