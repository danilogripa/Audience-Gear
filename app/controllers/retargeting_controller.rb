class RetargetingController < ActionController::Base

def index
  @user = User.find params[:campaign]
  raise @user.sites.inspect
end

end
