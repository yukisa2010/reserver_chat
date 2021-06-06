class Event < ApplicationRecord
    belongs_to :plan
    has_many :chats
    enum status: { not_offerred: 0, accepted: 1 }

    def participant
        User.find_by(id: self.participant_id)
    end

    def organizer
        User.find_by(id: self.organizer_id)
    end

    def over?
        self.scheduled_datetime < Time.now
    end
end
