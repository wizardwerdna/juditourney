module AuthenticatedTestHelper
  # Sets the current user in the session from the user fixtures.
  def login_as(user)
    @request.session[:user_id] = user ? users(user).id : nil
  end
  
  # added by ACG to facilitate rspec testing using mocks instead of fixtures
  def juditourney_login
    current_user = mock_model User
    current_user.stub!(:has_role?).with('quentin').and_return(true)
    controller.stub!(:current_user).and_return(current_user)
  end

  def authorize_as(user)
    @request.env["HTTP_AUTHORIZATION"] = user ? ActionController::HttpAuthentication::Basic.encode_credentials(users(user).login, 'test') : nil
  end
end
