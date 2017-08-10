class Agenda < ApplicationRecord
	belongs_to :pet
	belongs_to :user, optional: true

	validates :start_day, presence: true
	validates :end_day, presence: true
	validates :total_payment, presence: true
	validates :care_needs, presence: true
	validates :pet, presence: true
end