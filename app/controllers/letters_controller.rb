class LettersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_letter, only: [:show]
  def new
    @letter = Letter.new
  end

  def create
    @letter = current_user.sent_letters.build(letter_params)
    @letter.delivery_time = 1.minute.from_now
    @letter.status = 'pending'

    if @letter.save
      SendLetterJob.set(wait: 1.minute).perform_later(@letter)
      redirect_to @letter, notice: 'Letter was successfully created and will be sent in one minute.'
    else
      render :new
    end
  end

  def show
    # Redirect user if they're not the recipient of the letter
    redirect_to(root_path, alert: 'You do not have permission to view this letter.') unless current_user == @letter.receiver
  end


  def index
    @received_letters = current_user.received_letters
  end

  private
  
  def set_letter
    @letter = Letter.friendly.find(params[:id])
  end
  
  def letter_params
    params.require(:letter).permit(:receiver_id, :content)
    # delivery_time is not permitted from params, as it's set automatically
  end
end
