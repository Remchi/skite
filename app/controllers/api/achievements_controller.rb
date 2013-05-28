module Api
  class AchievementsController < ApplicationController
    respond_to :json
    before_filter :auth_only

    def index
      respond_with Achievement.find(:all)
    end

    def create
      respond_with :api, Achievement.create(achievement_params)
    end

    def show
      respond_with Achievement.find(params[:id])
    end

    def update
      achievement = Achievement.find(params[:id])
      achievement.assign_attributes(achievement_params)
      achievement.description = Kramdown::Document.new(achievement.description_src).to_html
      achievement.save
      render json: achievement
    end

    def destroy
      achievement = Achievement.find(params[:id])
      achievement.delete
      render json: nil
    end

    private

    def achievement_params
      params.require(:achievement).permit(:title, :achieved_at, :description_src)
    end
  end
end