class Letter < ApplicationRecord
    extend FriendlyId
    friendly_id :randomized_slug, use: :slugged
    belongs_to :sender, class_name: 'User', foreign_key: 'sender_id'
    belongs_to :receiver, class_name: 'User', foreign_key: 'receiver_id'
    
    belongs_to :stamp

    def calculate_delivery_time
      case stamp.value
      when 5
        5.seconds
      when 2
        15.seconds
      when 1
        30.seconds
      else
        # Default delivery time if no valid stamp is found
        1.minute
      end
    end
 
    # Add validations as needed, e.g., presence of content
    validates :content, presence: true
    has_rich_text :content
    private
    def randomized_slug
      SecureRandom.uuid
    end
  end