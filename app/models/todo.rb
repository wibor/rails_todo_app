class Todo < ApplicationRecord
  validates :name, presence: true
  belongs_to :tag
end
# name description important done