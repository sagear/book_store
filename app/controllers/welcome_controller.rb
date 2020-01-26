class WelcomeController < ApplicationController
  before_action :check_admin

  def home
  end

  private

  def check_admin
    if current_user.user?
      redirect_to books_path
    end
  end
end
