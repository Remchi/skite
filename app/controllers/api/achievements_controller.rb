module Api
  class AchievementsController < ApplicationController
    respond_to :json

    def index
      respond_with Achievement.find(:all)
    end
  end
end