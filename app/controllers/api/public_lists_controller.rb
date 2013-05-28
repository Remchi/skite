module Api
  class PublicListsController < ApplicationController
    respond_to :json

    def index
      respond_with List.where("public = ?", true)
    end
  end
end