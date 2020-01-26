class UsersController < ApplicationController
  before_action :check_admin

  def index
    @users = User.all
  end

  private

  def check_admin
    if current_user.user?
      redirect_to books_path
    end
  end
end
