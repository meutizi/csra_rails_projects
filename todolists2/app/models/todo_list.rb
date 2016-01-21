class TodoList < ActiveRecord::Base
    belongs_to :user
    has_many :todo_items, dependent: :destroy
    accepts_nested_attributes_for :todo_items
        default_scope { order :list_due_date }

end
