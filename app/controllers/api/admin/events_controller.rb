module Api
  module Admin
        class EventsController < ApplicationController
          skip_before_action :verify_authenticity_token

          #respond_to :json

          def index
            #if current_user.present? && current_user.user_type.eql?("ADMIN")
              @events = Event.all
           # else
            #  @events = "current user not an admin"
           # end
            respond_to do |format|

              format.json { render json: @events }
            end
          end
          def create_event_by_admin
            event = Event.new
            puts "^^^^^^^^^^^^^^^^^^^"
            puts "params[:description]"
            event.description = params[:description]
            event.event_type = params[:event_type]
            event.event_date = params[:event_date]
            event.duration = params[:duration]
            event.host = params[:host]
            event.location = params[:location]
            event.save
            render json: "event created sucessfully"
          end
          def new
            @event = Event.new
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