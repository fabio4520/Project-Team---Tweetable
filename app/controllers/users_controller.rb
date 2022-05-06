class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @user = set_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
end
