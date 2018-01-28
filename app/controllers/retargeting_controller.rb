class RetargetingController < ActionController::Base

  def index
    @campaign = Campaign.find params[:campaign]
    if @campaign.status? == true
      @sites = @campaign.sites.where(active: true)
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
