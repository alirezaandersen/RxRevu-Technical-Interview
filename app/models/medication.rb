class Medication < ApplicationRecord
  belongs_to :drug
  has_many :prescriptions

  #returns hash with disease.id as key values [[medication_id, disease_id], number of times used to treat disease]]
  def self.most_med_per_disease
    most_per_disease = Prescription.group(:medication_id, :disease_id).count
    most_per_disease.group_by { |mh, v| p mh.last }
  end

  #groups diseases as key and all drugs related to it. {(disease.id)96929=>{(drug.id)1312=>(number of times prescribed to treat drugs)105, 8715=>85, 5764=>196, 3360=>201, 3940=>140}
  def self.group_drug_by_disease
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
  #{"Disease: disease name "=>"Drug: drug name"}
  def self.most_common_medication_ordered_to_treat_each_disease
    hospital_drugs = Hash.new()
    self.group_drug_by_disease.each do |hos_id, med_hash|
      popular_meds = med_hash.max_by { |k, v| v }
      drug = Drug.find(popular_meds[0]).name
      disease = Disease.find(hos_id).name
      hospital_drugs["Disease: #{disease}"] = "Drug: #{drug}"
    end
    hospital_drugs
  end

end
