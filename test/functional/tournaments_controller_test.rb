require File.dirname(__FILE__) + '/../test_helper'

class TournamentsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:tournaments)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_tournament
    assert_difference('Tournament.count') do
      post :create, :tournament => { }
    end

    assert_redirected_to tournament_path(assigns(:tournament))
  end

  def test_should_show_tournament
    get :show, :id => tournaments(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => tournaments(:one).id
    assert_response :success
  end

  def test_should_update_tournament
    put :update, :id => tournaments(:one).id, :tournament => { }
    assert_redirected_to tournament_path(assigns(:tournament))
  end

  def test_should_destroy_tournament
    assert_difference('Tournament.count', -1) do
      delete :destroy, :id => tournaments(:one).id
    end

    assert_redirected_to tournaments_path
  end
end
