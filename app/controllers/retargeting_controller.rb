class RetargetingController < ActionController::Base

def index
  @user = User.find params[:campaign]
  if @user.status? == true
    @sites = @user.sites.where(active: true)
  end
  js = ""
  @sites.each do |site|
    js += "\n// #{site.name} \n"
    js += site.partner
    js += "\n// END #{site.name}\n"
  end

  respond_to do |format|
    format.js { render :js => js }
  end
end

end
