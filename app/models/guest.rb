class Guest < ActiveRecord::Base
	validates :food, presence: true
end
