class RetargetingController < ActionController::Base

  layout false

  def index
    @campaign = Campaign.find params[:campaign]
    ahoy.track_visit if ahoy.new_visit?
    ahoy.track @campaign.name, title: "Hot, Flat, and Crowded"
    @affiliates = []
    if @campaign.status? == true
      @affiliates = @campaign.affiliates.where(active: true)
    end
    self.content_type = "application/javascript;"
  end
end
