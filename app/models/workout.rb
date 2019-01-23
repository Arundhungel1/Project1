class Workout < ApplicationRecord
  has_many :exercises, dependent: :destroy
  belongs_to :user, :optional => true
end
