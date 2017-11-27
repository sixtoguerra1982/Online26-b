json.extract! event, :id, :title, :start, :end, :allday, :created_at, :updated_at
json.set! :editable, event.editable?
