class TodoItem < ApplicationRecord
  belongs_to :todo_list
  enum :status, %i[pending completed]
end
