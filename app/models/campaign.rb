class Campaign < ActiveRecord::Base
  belongs_to :user
  
  has_many :characters
  has_many :discussions, class: Campaign::Discussion
  has_many :pages, class: Campaign::Book
  has_many :meta_tags, class: Campaign::MetaTag
  has_many :users, class: Campaign::User
  has_many :journals, class: Character::Journal

end