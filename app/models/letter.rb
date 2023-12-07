class Letter < ApplicationRecord
    extend FriendlyId
    friendly_id :randomized_slug, use: :slugged
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
    before_create :set_default_expiration

  

 
    # Add validations as needed, e.g., presence of content
    validates :content, presence: true

    private
    def set_default_expiration
      self.expires_at ||= 1.week.from_now
    end
    def randomized_slug
      SecureRandom.uuid
    end
  end