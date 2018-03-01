module AdvertisersHelper
  def get_advertiser_type_name(id)
    advertiser_type = ['Network','E-Commerce','Trading Desk']
    return advertiser_type[id - 1]
  end
end
