class Letter < ApplicationRecord
    extend FriendlyId
    friendly_id :randomized_slug, use: :slugged
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
    
    belongs_to :stamp, optional: true

  
 
    # Add validations as needed, e.g., presence of content
    validates :content, presence: true
    has_rich_text :content
    private
    def randomized_slug
      SecureRandom.uuid
    end
  end