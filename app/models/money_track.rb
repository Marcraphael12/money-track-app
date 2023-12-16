# frozen_string_literal: true

class MoneyTrack < ApplicationRecord
  belongs_to :user
  has_many :money_groups, dependent: :destroy
  has_many :groups, through: :money_groups, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :amount, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
