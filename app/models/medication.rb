class Medication < ApplicationRecord
  belongs_to :drug
  has_many :prescriptions

  def self.most_med_per_disease
    most_per_disease = Prescription.group(:medication_id, :disease_id).count
    most_per_disease.group_by { |mh, v| p mh.last }
  end

  def self.group_by_disease
    disease_hash = Hash.new(0)
    self.most_med_per_disease.each do |dis, arr |
      disease = Disease.find(dis).id
      h = Hash.new(0)
      arr.each do |med_id_dis, total|
        med_id = med_id_dis[0]
        drug_id = self.find(med_id).drug_id
        h[drug_id] += total
      end
      disease_hash[disease] = h
    end
     disease_hash
  end

  def self.most_common_medication_ordered_to_treat_each_disease
    hospital_drugs = Hash.new()
    self.group_by_disease.each do |hos_id, med_hash|
      popular_meds = med_hash.max_by { |k, v| v }
      drug = Drug.find(popular_meds[0]).name
      disease = Disease.find(hos_id).name
      hospital_drugs["Disease: #{disease}"] = "Drug: #{drug}"
    end
    hospital_drugs
  end

end
