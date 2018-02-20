class RetargetingController < ActionController::Base

  layout false

  def index
    @campaign = Campaign.find params[:campaign_id]
    @affiliates = []
    if @campaign.status? == true
      @campaign.affiliates.where(active: true).each do |affiliate|
        affiliate.partner = affiliate.partner.gsub("{CAMPAIGN_ID}", params["campaign_id"])
        affiliate.partner = affiliate.partner.gsub("{CAMPAIGN_NAME}", params["campaign_name"])
        # options params
        affiliate.partner = affiliate.partner.gsub("{TYPE}", params["type"]) if params["type"]
        affiliate.partner = affiliate.partner.gsub("{PRODUCT_ID1}", params["product_id1"]) if params["product_id1"]
        affiliate.partner = affiliate.partner.gsub("{ID_CATEGORY}", params["id_category"]) if params["id_category"]
        affiliate.partner = affiliate.partner.gsub("{STOCK}", params["stock"]) if params["stock"]
        affiliate.partner = affiliate.partner.gsub("{PRODUCT_SKU}", params["product_sku"]) if params["product_sku"]
        affiliate.partner = affiliate.partner.gsub("{PRODUCT_NAME}", params["product_name"]) if params["product_name"]
        affiliate.partner = affiliate.partner.gsub("{PRODUCT_DESC}", params["product_desc"]) if params["product_desc"]
        affiliate.partner = affiliate.partner.gsub("{PRODUCT_PHOTO}", params["product_photo"]) if params["product_photo"]
        affiliate.partner = affiliate.partner.gsub("{PRICE1}", params["price1"]) if params["price1"]
        affiliate.partner = affiliate.partner.gsub("{PRICE2}", params["price2"]) if params["price2"]
        affiliate.partner = affiliate.partner.gsub("{PRODUCT_CURRENCY}", params["product_currency"]) if params["product_currency"]
        affiliate.partner = affiliate.partner.gsub("{URL_PRODUCT}", params["url_product"]) if params["url_product"]
        affiliate.partner = affiliate.partner.gsub("{AMOUNT}", params["amount"]) if params["amount"]
        affiliate.partner = affiliate.partner.gsub("{TRANSACTION}", params["transaction"]) if params["transaction"]

        @affiliates << affiliate
      end
    end
    self.content_type = "application/javascript;"
  end

end
