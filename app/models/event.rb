class Event < ApplicationRecord
    belongs_to :plan
    enum status: { not_offerred: 0, accepted: 1, over: 2 }

    def participant
        User.find(self.participant_id)
    end

    def organizer
        User.find(self.organizer_id)
    end
end
