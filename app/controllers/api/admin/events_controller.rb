module Api
  module Admin
        class EventsController < ApplicationController
          skip_before_action :verify_authenticity_token

          def index
              @events = Event.all
            respond_to do |format|
            format.json { render json: @events }
            end
          end
          def create_event_by_admin
            event = Event.new
            event.description = params[:description]
            event.event_type = params[:event_type]
            event.event_date = params[:event_date]
            event.duration = params[:duration]
            event.host = params[:host]
            event.location = params[:location]
            event.save
            render json: "event created sucessfully"
          end
          def user_intrested_events
            event_subscriptions = EventSubscription.where("is_intrested=?", true)
            grouped_arts = event_subscriptions.group_by {|art| "event-"+art.event_id.to_s} if event_subscriptions.present?
            respond_to do |format|
              format.json { render json: grouped_arts }
            end
          end
          def attendees_confirmed_by_admin
            event_subscription = EventSubscription.find_by_user_id_and_event_id(params[:user_id], params[:event_id])
            if event_subscription.present?
              event_subscription.is_confirmed_by_admin = true
              event_subscription.is_removed_by_admin = false
              event_subscription.save
            end
            render :json =>{ :status => "event confirmed by admin"}
          end
          def attendees_removed_by_admin
            event_subscription = EventSubscription.find_by_user_id_and_event_id(params[:user_id], params[:event_id])
            if event_subscription.present?
              event_subscription.is_confirmed_by_admin = false
              event_subscription.is_removed_by_admin = true
              event_subscription.save
            end
            render :json =>{ :status => "event removed by admin"}
          end
          def confirmed_list
            event_subscription = EventSubscription.where("is_confirmed_by_admin=? and is_removed_by_admin=?", true, false)
            respond_to do |format|
              format.json { render :json => {:confirmed_list => event_subscription.present? ? event_subscription : "there is no confirmed list. " }}
            end
          end
          def removed_list
            event_subscription = EventSubscription.where("is_confirmed_by_admin=? and is_removed_by_admin=?", false, true)
            respond_to do |format|
              format.json { render :json => {:removed_list => event_subscription.present? ? event_subscription : "there is no removed list. " }}
            end
          end
          def attendees_willing_count
            event_subscription = EventSubscription.where("is_intrested=?", true)
            respond_to do |format|
              format.json { render :json => {:willing_count => event_subscription.present? ? event_subscription.size() : 0  }}
            end
          end
          def attendees_not_willing_count
            event_subscription = EventSubscription.where("is_intrested=?", false)
            respond_to do |format|
              format.json { render :json => {:not_willing_count => event_subscription.present? ? event_subscription.size() : 0  }}
            end
          end
        end
  end
end