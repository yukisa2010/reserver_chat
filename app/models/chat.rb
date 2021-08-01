class Chat < ApplicationRecord
    belongs_to :event

    def sender
        User.find_by_id(self.sender_id)
    end
end
