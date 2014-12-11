class Guest < ActiveRecord::Base
	validates :food, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
end
