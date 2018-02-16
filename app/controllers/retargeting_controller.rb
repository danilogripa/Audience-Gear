class RetargetingController < ActionController::Base

  layout false

  def index
    @campaign = Campaign.find params[:campaign]
    @affiliates = []
    if @campaign.status? == true
      @campaign.affiliates.where(active: true).each do |affiliate|
        affiliate.partner = affiliate.partner.gsub("{CAMPAIGN_ID}", @campaign.id.to_s)
        affiliate.partner = affiliate.partner.gsub("{CAMPAIGN_NAME}", @campaign.name.to_s)
        @affiliates << affiliate
      end
    end
    self.content_type = "application/javascript;"
  end

end
