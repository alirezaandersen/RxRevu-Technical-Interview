class Prescription < ApplicationRecord
 belongs_to :prescriber
 belongs_to :hospital
 belongs_to :medication
 belongs_to :disease
end
