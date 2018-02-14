json.extract! event, :id, :description, :type, :event_date, :duration, :host, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
