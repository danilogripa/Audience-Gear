class RetargetingController < ActionController::Base

  def index
    @campaign = Campaign.find params[:campaign]
    @affiliates = []
    if @campaign.status? == true
      @affiliates = @campaign.affiliates.where(active: true)
    end
  end

end
