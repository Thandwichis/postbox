class LettersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_letter, only: [:show, :destroy]
  def new
    @letter = Letter.new
  end

  def create
    @letter = current_user.sent_letters.build(letter_params)
    # Set receiver_username here if necessary, for example:
    # receiver = User.find_by(username: params[:letter][:receiver_username])
    # @letter.receiver_id = receiver.id if receiver
  
    @letter.status = 'pending'
    @letter.delivery_time = Time.zone.now + 15.seconds
    # @letter.expires_at = 1.week.from_now
    if @letter.save
      SendLetterJob.set(wait: 15.seconds).perform_later(@letter.id)
      redirect_to root_path, notice: 'Letter was successfully created and will be sent in 15 seconds.'
    else
      render :new
    end
  end
  def self.delete_expired
    Letter.where('expires_at < ? AND saved = ?', Time.current, false).destroy_all
  end
  def toggle_save
    @letter = Letter.find(params[:id])
    @letter.update(saved: !@letter.saved)
    redirect_to letter_path(@letter)
  end
  

  def show
    @letter = Letter.find(params[:id])
  # if @letter.expired?
  #   redirect_to letters_path, alert: "This letter has expired."
  # else
    # Redirect user if they're not the recipient of the letter
    redirect_to(root_path, alert: 'You do not have permission to view this letter.') unless current_user == @letter.receiver
    # Assuming @letter is set using a before_action
    if current_user == @letter.receiver && @letter.read_at.nil?
      @letter.update(read_at: Time.current)
    end
  end
end
  # def save_to_shelf
  #   @letter = Letter.find(params[:id])
  #   # Logic to save the letter to the shelf
  #   redirect_to letter_path(@letter), notice: 'Letter was successfully saved to shelf.'
  # end
  
  def index
    # Only show letters that have been delivered
    @received_letters = current_user.received_letters.where(status: 'delivered').order(created_at: :desc)

    @read_letters = @received_letters.where.not(read_at: nil).order(created_at: :desc)
    @unread_letters = @received_letters.where(read_at: nil).order(created_at: :desc)


  end
  def open_letter
    @letter = Letter.friendly.find(params[:id])
    # Logic to mark the letter as read, if appropriate
    if current_user == @letter.receiver && @letter.read_at.nil?
      @letter.update(read_at: Time.current)
    end
  end
  def destroy
      @letter.destroy
      redirect_to letters_path, notice: 'Letter was successfully deleted.'

  end
  

  private
  
  def set_letter
    @letter = Letter.friendly.find(params[:id])
  end
  

  
  def letter_params
    params.require(:letter).permit(:content,:receiver_id)
  end
end
