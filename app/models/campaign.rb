class Campaign < ActiveRecord::Base
  include DataFields

  belongs_to :user

  has_many :characters
  has_many :discussions, class: ::Campaign::Discussion
  has_many :pages, class: ::Campaign::Book
  has_many :meta_tags, class: ::Campaign::MetaTag
  has_many :members, class: ::Campaign::Member
  has_many :journals, class: ::Character::Journal
  has_many :data_stores, class: ::Campaign::DataStore

  field :content, :string
  field :event_url, :string
  field :player_hangout, :string
  field :public_hangout, :string
  field :hangout_ping, :date
  field :genre_text, :string
  field :tabs, :hash

  enum permission: [:_public, :_private]
end
