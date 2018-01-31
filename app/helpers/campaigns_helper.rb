module CampaignsHelper
  def get_campaign_type_name(id)
    campaign_type = ['CPC','Email Mkt']
    return campaign_type[id - 1]
  end
end
