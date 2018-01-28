class UsersController < ApplicationController

	before_action :authenticate_admin_user!

	def index
		@users = User.paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			#http://stalksystem-dev.sa-east-1.elasticbeanstalk.com
			@user.rtg_tag = "<script type=\"text/javascript\" src=\"localhost:3000/rtg?campaign=#{@user.id}&name=#{@user.company_name}\"></script>"
			@user.save
			redirect_to @user
		else
			render 'new'
		end

	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to @user
	end

	def active
    @user = User.find(params[:user_id])
    if @user.status == false
      @user.status = true
    else
      @user.status = false
    end
    @user.save
    redirect_to @user
  end

	private

	def user_params
		params.require(:user).permit(
			:company_name,
			:email,
			:contact_name,
			:phone,
			:cnpj,
			:user_type,
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
