class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:sign_out_thanks]
  def index
    @users = User.all
  end
  def sign_out_thanks
  end
end
