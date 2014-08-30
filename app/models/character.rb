class Character < ActiveRecord::Base
  include DataFields
  belongs_to :user
  belongs_to :campaign

  has_many :data_stores, class: Character::DataStore
  has_many :journals, class: Character::Journal
end
