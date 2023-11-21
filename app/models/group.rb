class Group < ApplicationRecord
  belongs_to :user
  has_many :money_groups, dependent: :destroy
  has_many :money_tracks, through: :money_groups, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }

  def add_money_track(options)
    # The line `money_track = MoneyTrack.create!(name: options[:name], amount: options[:amount], user:
    # options[:user])` is creating a new instance of the `MoneyTrack` model with the specified attributes.
    # The `create!` method is used to create a new record in the database and raises an exception if there
    # are any validation errors. The attributes for the new `MoneyTrack` instance are provided through the
    # `options` hash, which includes the `name`, `amount`, and `user` attributes.
    money_track = MoneyTrack.create!(name: options[:name], amount: options[:amount], user: options[:user])

    money_tracks << money_track

    money_track
  end
end
