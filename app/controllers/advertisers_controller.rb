class AdvertisersController < ApplicationController

	before_action :authenticate_admin_user!

	def index
		@advertisers = Advertiser.paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@advertiser = Advertiser.new
	end

	def create
		@advertiser = Advertiser.new(advertiser_params)
		if @advertiser.save
			@advertiser.save
			redirect_to @advertiser
		else
			render 'new'
		end

	end

	def show
		@advertiser = Advertiser.find(params[:id])
	end

	def edit
		@advertiser = Advertiser.find(params[:id])
	end

	def update
		@advertiser = Advertiser.find(params[:id])
		if @advertiser.update(advertiser_params)
			redirect_to @advertiser
		else
			render 'edit'
		end
	end

	def destroy
		@advertiser = Advertiser.find(params[:id])
		@advertiser.destroy
		redirect_to @advertiser
	end

	def active
    @advertiser = Advertiser.find(params[:advertiser_id])
    if @advertiser.status == false
      @advertiser.status = true
    else
      @advertiser.status = false
    end
    @advertiser.save
    redirect_to @advertiser
  end

	private

	def advertiser_params
		params.require(:advertiser).permit(
			:name,
			:email,
			:contact_name,
			:phone,
			:cnpj,
			:status,
			:created_at,
			:updated_at
		)
	end
end
