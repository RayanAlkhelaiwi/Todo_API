class Todo < ApplicationRecord
	validates :title, presence: true
  validates :body, presence: true
end
