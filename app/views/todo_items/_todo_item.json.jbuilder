json.extract! todo_item, :id, :name, :todo_list_id, :status, :created_at, :updated_at
json.url todo_item_url(todo_item, format: :json)
