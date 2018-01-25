class UsersController < ApplicationController

	def index
		@users = User.paginate(:page => params[:page], :per_page => 10)
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
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
			sites_attributes: [
				:name,
				:url,
				:category,
				:type_site
			])
	end
end
