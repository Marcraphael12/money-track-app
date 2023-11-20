# frozen_string_literal: true

class MoneyTrack < ApplicationRecord
  belongs_to :user
  has_many :money_groups
  has_many :groups, through: :money_groups
end
