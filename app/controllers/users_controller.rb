class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if @user.family?
      # action children#new
      @child = Child.new
      @child.filiations.build
      # action filitations#new
      @filiation = Filiation.new
      # action filiations#edit
    end
    edit_filiation
  end

  def edit_filiation
    @filiations = current_user.filiations.where(progress: :pending)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to @user
  end

  private

  def user_params
    params.require(:user).permit(:role, :first_name, :last_name, :bio, :photo)
  end
end
