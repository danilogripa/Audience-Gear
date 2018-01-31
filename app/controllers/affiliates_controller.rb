class AffiliatesController < ApplicationController

  def index

  end

  def new
    @affiliate = Affiliate.new(campaign_id: params[:campaign_id])
  end

  def create
    @affiliate = Affiliate.new(affiliate_params)
		if @affiliate.save
			redirect_to campaign_path(@affiliate.campaign_id)
		else
			render 'new'
		end
  end

  def edit
    @affiliate = Affiliate.find params[:id]
  end

  def update
		@affiliate = Affiliate.find(params[:id])
		if @affiliate.update(affiliate_params)
			redirect_to campaign_path(@affiliate.campaign_id)
		else
			render 'edit'
		end
	end

  def destroy
		@affiliate = Affiliate.find(params[:id])
		@affiliate.destroy
		redirect_to campaign_path(@affiliate.campaign_id)
	end

  def active
    @affiliate = Affiliate.find(params[:affiliate_id])
    if @affiliate.active == false
      @affiliate.active = true
    else
      @affiliate.active = false
    end
    @affiliate.save
    redirect_to campaign_path(@affiliate.campaign_id)
  end

  private

  def affiliate_params
    params.require(:affiliate).permit(
      :campaign_id,
      :name,
      :url,
      :category,
      :type_site,
      :partner
    )
  end

end
