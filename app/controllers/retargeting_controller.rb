class RetargetingController < ActionController::Base

  layout false

  def index
    @campaign = Campaign.find params[:campaign]
    @affiliates = []
    if @campaign.status? == true
      @affiliates = @campaign.affiliates.where(active: true)
    end
    self.content_type = "application/javascript;"
  end
end
