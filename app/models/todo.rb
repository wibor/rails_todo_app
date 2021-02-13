class Todo < ApplicationRecord
  validates :name, presence: true
end
# name description important done