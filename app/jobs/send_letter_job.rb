class SendLetterJob < ApplicationJob
  include Sidekiq::Worker

  queue_as :default

  def perform(letter_id)
    letter = Letter.find_by(id: letter_id)
    return unless letter

    # Update the letter's status or other actions
    letter.update(status: 'delivered')
  end
end
