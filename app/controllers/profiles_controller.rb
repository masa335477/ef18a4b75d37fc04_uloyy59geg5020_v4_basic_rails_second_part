class ProfilesController < ApplicationController
    def show
      @user = current_user
    end

    def edit
      @user = current_user
    end

    def update
      @user = current_user
      if @user.update(profile_params)
        redirect_to profile_path, notice: t('defaults.flash_message.updated', item: User.model_name.human)
      else
        flash.now[:danger] = t('defaults.flash_message.not_updated', item: User.model_name.human)
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def profile_params
      params.require(:user).permit(:first_name, :last_name, :email, :avatar)
    end
end
