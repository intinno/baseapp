# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  include RoleRequirementSystem
  
  helper :all # include all helpers, all the time
  filter_parameter_logging :password, :password_confirmation
  before_filter :instantiate_controller_and_action_names
  
  # Return the value for a given setting
  def s(identifier)
    Setting.get(identifier)
  end
  helper_method :s
 
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '9fe6825f97cc334d88925fde5c4808a8'

   
private
  def instantiate_controller_and_action_names
    @current_action = action_name
    @current_controller = controller_name
  end
end
