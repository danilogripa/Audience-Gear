class SitesController < ApplicationController

  def index

  end

  def new
    @site = Site.new(campaign_id: params[:campaign_id])
  end

  def create
    @site = Site.new(site_params)
		if @site.save
			redirect_to campaign_path(@site.campaign_id)
		else
			render 'new'
		end
  end

  def edit
    @site = Site.find params[:id]
  end

  def update
		@site = Site.find(params[:id])
		if @site.update(site_params)
			redirect_to campaign_path(@site.campaign_id)
		else
			render 'edit'
		end
	end

  def destroy
		@site = Site.find(params[:id])
		@site.destroy
		redirect_to campaign_path(@site.campaign_id)
	end

  def active
    @site = Site.find(params[:site_id])
    if @site.active == false
      @site.active = true
    else
      @site.active = false
    end
    @site.save
    redirect_to campaign_path(@site.campaign_id)
  end

  private

  def site_params
    params.require(:site).permit(
      :campaign_id,
      :name,
      :url,
      :category,
      :type_site,
      :partner
    )
  end

end
