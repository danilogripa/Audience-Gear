class CampaignsController < ApplicationController

	before_action :authenticate_admin_user!

	def index
		@campaigns = Campaign.paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@campaign = Campaign.new
	end

	def create
		@campaign = Campaign.new(campaign_params)
		if @campaign.save
			#http://stalksystem-dev.sa-east-1.elasticbeanstalk.com
			@campaign.rtg_tag = "<script type=\"text/javascript\" src=\"http://stalksystem-dev.sa-east-1.elasticbeanstalk.com/rtg?campaign=#{@campaign.id}&name=#{@campaign.company_name}\"></script>"
			@campaign.save
			redirect_to @campaign
		else
			render 'new'
		end

	end

	def show
		@campaign = Campaign.find(params[:id])
	end

	def edit
		@campaign = Campaign.find(params[:id])
	end

	def update
		@campaign = Campaign.find(params[:id])
		if @campaign.update(campaign_params)
			redirect_to @campaign
		else
			render 'edit'
		end
	end

	def destroy
		@campaign = Campaign.find(params[:id])
		@campaign.destroy
		redirect_to @campaign
	end

	def active
    @campaign = Campaign.find(params[:campaign_id])
    if @campaign.status == false
      @campaign.status = true
    else
      @campaign.status = false
    end
    @campaign.save
    redirect_to @campaign
  end

	private

	def campaign_params
		params.require(:campaign).permit(
			:company_name,
			:email,
			:contact_name,
			:phone,
			:cnpj,
			:campaign_type,
			:status,
			:created_at,
			:updated_at,
			:rtg_tag,
			sites_attributes: [
				:name,
				:url,
				:category,
				:type_site
			])
	end
end