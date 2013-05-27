module Api
  class ListsController < ApplicationController
    respond_to :json

    def index
      respond_with List.find(:all)
    end

    def create
      respond_with :api, List.create(list_params)
    end

    def show
      respond_with List.find(params[:id])
    end

    def update
      list = List.find(params[:id])
      list.update_attributes(list_params)
      render json: list
    end

    def destroy
      list = List.find(params[:id])
      list.delete
      render json: {}
    end

    private

    def list_params
      params.require(:list).permit(:title, :public)
    end

  end
end