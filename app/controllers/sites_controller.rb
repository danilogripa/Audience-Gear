class SitesController < ApplicationController

  def index

  end

  def new
    @site = Site.new(user_id: params[:user_id])
  end

  def create
    @site = Site.new(site_params)
		if @site.save
			redirect_to user_path(@site.user_id)
		else
			render 'new'
		end
  end

  private

  def site_params
    params.require(:site).permit(
      :user_id,
      :name,
      :url,
      :category,
      :type_site
    )
  end

end
