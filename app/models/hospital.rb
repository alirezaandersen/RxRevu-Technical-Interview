class Hospital < ApplicationRecord
  has_many :prescriptions
  has_many :medications, through: :prescriptions

  # {Hospital name => number of total prescriptions}
  def self.total_perscriptions_per_hospital
    hosp_id_hash = Prescription.group(:hospital_id).count #{12=>1463, 42=>1532, 63=>2095}
    nh = Hash.new()
    hosp_id_hash.each do | hosp_id, total_scripts |
      name = self.find(hosp_id).hospital_name
      nh["hospital: #{name}"] = "total_scripts: #{total_scripts}"
    end
    nh
  end

  #{Hospital name => drug name}
  def self.most_commonly_prescribed_drug_at_each_hospital
    hospital_drugs = Hash.new()
    Prescription.group_drug_by_hospital.each do |hos_id, drug_hash|
      popular_drug = drug_hash.max_by { |k, v| v }
      drug = Drug.find(popular_drug[0]).name
      hospital = Hospital.find(hos_id).hospital_name
      hospital_drugs[hospital] = drug
    end
    hospital_drugs
  end

end
