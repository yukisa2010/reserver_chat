class Event < ApplicationRecord
    belongs_to :plan
    enum status: { no_offer: 0, accepted: 1, over: 2 }

end
