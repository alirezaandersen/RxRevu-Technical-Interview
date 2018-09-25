class Hospital < ApplicationRecord
  has_many :prescriptions
  has_many :medications, through: :prescriptions

end
