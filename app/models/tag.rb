class Tag < ApplicationRecord
  enum status: [ :active, :archived, :other] # 0, 1, 2
  has_many :todos
end
