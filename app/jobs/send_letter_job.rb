class SendLetterJob < ApplicationJob
  queue_as :default

  def perform(letter)
    # Update the letter's status or perform other necessary actions
    letter.update(status: 'sent')
    # Additional logic for sending the letter
  end
end