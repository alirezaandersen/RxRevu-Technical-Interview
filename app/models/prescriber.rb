class Prescriber < ApplicationRecord
  has_many :prescriptions


  def self.provider_effective_doses#(frequency = nil, days = nil)#passing in params wrong somehow from controller
    # frequency = 4 #frequency.to_i
    # days = 90 #days.to_i
    pp_hash = Prescription.group('prescriber_id').where(frequency_per_day: 4, days_supply: 90).count
    dr_hash = Hash.new()
    pp_hash.each  do |dr_id, num_of_prescripts|
      dr =  Prescriber.find(dr_id).prescriber_name
      dr_hash["Prescriber: #{dr}"] = "Higest frequency of effective doses written: #{num_of_prescripts}"
    end
    dr_hash
  end
end
