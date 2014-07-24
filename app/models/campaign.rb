class Campaign < ActiveRecord::Base
  include JsonStore

  belongs_to :user

  has_many :characters
  has_many :discussions, class: Campaign::Discussion
  has_many :pages, class: Campaign::Book
  has_many :meta_tags, class: Campaign::MetaTag
  has_many :users, class: Campaign::User
  has_many :journals, class: Character::Journal

  field :content, :string
  field :event_url, :string
  field :player_hangout, :string
  field :public_hangout, :string
  field :hangout_ping, :date
  field :genre_text, :string
  field :tabs, :hash
end
