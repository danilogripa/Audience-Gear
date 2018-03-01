module CampaignsHelper
  def get_campaign_type_name(id)
    campaign_type = ['CPA','CPL','CPC','CPM']
    return campaign_type[id - 1]
  end
end
