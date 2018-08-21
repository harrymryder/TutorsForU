class UsersController < ApplicationController

  def index
    # ideally with `.where` with activerecord
    # @users = User.where
    @users = User.all.reject { |u| u.tutor? }
  end

end
