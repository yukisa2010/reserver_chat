class Plan < ApplicationRecord
    belongs_to :user
    has_many :events

    validates :plan_name, presence: true
end
