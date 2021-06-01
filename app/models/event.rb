class Event < ApplicationRecord
    belongs_to :plan
    enum status: { not_offerred: 0, accepted: 1 }

    def participant
        User.find(self.participant_id)
    end

    def organizer
        User.find(self.organizer_id)
    end

    def over?
        self.scheduled_datetime < Time.now
    end
end
