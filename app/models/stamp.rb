class Stamp < ApplicationRecord
    has_many :user_stamps
    has_many :users, through: :user_stamps
end
