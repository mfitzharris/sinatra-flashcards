class Deck < ActiveRecord::Base
  has_many :cards, :rounds

  validates :name, presence: true, uniqueness: true
end
