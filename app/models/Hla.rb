class Hla < ActiveRecord::Base
  belongs_to :user
  acts_as_votable
  validates :title, presence: true, length: {minimum: 3}
end
