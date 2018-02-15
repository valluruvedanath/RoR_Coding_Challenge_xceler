module Api
  module V1
    class EventsController < ApplicationController
      #respond_to :json

      def index
       # if current_user.present? && current_user.user_type.eql?("USER")
        @events = Event.all
       # else
       #   @events = "current user not an admin"
       # end
        respond_to do |format|

          format.json { render json: @events }
        end
      end

      def show
        respond_with Event.find(params[:id])
      end

      def create
        respond_with Event.create(params[:event])
      end

      def update
        respond_with Event.update(params[:id], params[:event])
      end

      def destroy
        respond_with Event.destroy(params[:id])
      end
    end
  end
end
