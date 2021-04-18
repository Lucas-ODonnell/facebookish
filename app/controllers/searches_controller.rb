class SearchesController < ApplicationController
  def index
    @users = User.select do |user|
      user != current_user && !current_user.friends.include?(user)
    end
  end
end
