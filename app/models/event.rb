class Event < ApplicationRecord
    belongs_to :plan
    enum status: { applied: 0, accepted: 1, over: 2 }
end
