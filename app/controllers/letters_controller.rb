class LettersController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_letter, only: [:show, :destroy]

  
  def new
    @letter = Letter.new
  end

  def create
    @letter = current_user.sent_letters.build(letter_params)
    @letter.status = 'pending'
    @letter.delivery_time = Time.zone.now + @letter.calculate_delivery_time    # Set receiver_username here if necessary, for example:
    # receiver = User.find_by(username: params[:letter][:receiver_username])
    # @letter.receiver_id = receiver.id if receiver

    if @letter.save
      use_stamp_for_letter(@letter)
      SendLetterJob.set(wait: @letter.calculate_delivery_time).perform_later(@letter.id)
      formatted_time = view_context.humanize_seconds(@letter.calculate_delivery_time)
      redirect_to root_path, notice: "Letter was successfully created and will be sent in #{formatted_time}."    else
      render :new
    end
  end
  
  def toggle_save
    @letter = Letter.friendly.find(params[:id])
    @letter.update(saved: !@letter.saved)
    redirect_to letter_path(@letter)
  end


  

  def show
    @letter = Letter.friendly.find(params[:id])
    # Redirect user if they're not the recipient of the letter
    redirect_to(root_path, alert: 'You do not have permission to view this letter.') unless current_user == @letter.receiver
    # Assuming @letter is set using a before_action
    if current_user == @letter.receiver && @letter.read_at.nil?
      @letter.update(read_at: Time.current)
    end
  
  end
  
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
  

  def use_stamp_for_letter(letter)
    stamp = current_user.user_stamps.find_by(stamp_id: letter.stamp_id)
    if stamp.present?
      stamp.quantity -= 1
      if stamp.quantity.zero?
        stamp.destroy
      else
        stamp.save
      end
    end
  end
  def set_letter
    @letter = Letter.friendly.find(params[:id])
  end
  

  
  def letter_params
    params.require(:letter).permit(:receiver_id, :content, :stamp_id)
  end
  
end
