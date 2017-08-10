class Pet < ApplicationRecord
	belongs_to :user
	belongs_to :pet_kind

	has_many :agendas, dependent: :destroy

	validates :name, presence: true
	validates :pet_kind, presence: true
	validates :breed, presence: true
	validates :date_of_birth, presence: true
	validates :size, presence: true
	validates :user, presence: true

	enum size: [:small, :medium, :large]
end