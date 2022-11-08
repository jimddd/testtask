class Event < ApplicationRecord
  has_many :players, dependent: :destroy


end
