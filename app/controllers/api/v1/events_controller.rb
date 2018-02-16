module Api
  module V1
    class EventsController < ApplicationController
      skip_before_action :verify_authenticity_token

      #respond_to :json

      def index
       # if current_user.present? && current_user.user_type.eql?("USER")
        @events = []
        event_subscriptions = EventSubscription.where('user_id=? and is_intrested=?', current_user.id, true) if current_user.present?
        if event_subscriptions.present?
          event_subscriptions.each do |event_subscription|
            @events << event_subscription.event
          end
        end
       # else
       #   @events = "current user not an admin"
       # end
        respond_to do |format|

          format.json { render json: @events.present? ? @events : "There is no events for you. " }
        end
      end
     def user_attend_to_event
       status = ""
       #user = User.find_by_id(params[:user_id]) if params[:user_id].present?
       event = Event.find_by_id(params[:event_id])if params[:event_id].present?

       if current_user.present? && event.present?
       event_subscription = EventSubscription.find_by_event_id_and_user_id(event.id, current_user.id)
       event_subscription = EventSubscription.new if !event_subscription.present?
       event_subscription.event_id = event.id
       event_subscription.user_id = current_user.id
       event_subscription.is_intrested = true
       event_subscription.save
         status = "User was successfully added to event. "
       else
         status = "User was not added to event"
       end
       render json: status
     end
      def user_canceled_event
        status = ""
        event_subscription = EventSubscription.find_by_event_id_and_user_id_and_is_intrested(params[:event_id], current_user.id, true) if current_user.present?
        if event_subscription.present?
          event_subscription.is_intrested = false
          event_subscription.save
          status = "user was successfully cancel the event "
        else
          status = "user not found. "
        end
        render json: status
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
