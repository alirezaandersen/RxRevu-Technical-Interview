class Prescription < ApplicationRecord
  belongs_to :prescriber
  belongs_to :hospital
  belongs_to :medication
  belongs_to :disease


  #returns array with hospital id, medication_id, number of times medication_id was used at hospital
  # [42, 16765295]=>111
  def specific_type_of_medication_per_hospital
    self.group(:hospital_id, :medication_id).count
  end

  #returns {"Drug: drug.name"=> "Number of times prescribed: integer value (total times drug has been prescribed)"}
  def self.drugs_prescribed_number_of_times
    num_of_ind_med = self.group(:medication_id).count
    common_drug = Hash.new(0)

    num_of_ind_med.each do |med_id, total|
      drug_id = Medication.find_by(id: med_id).drug.name
      common_drug[drug_id] += total
    end
    self.format_script(common_drug)
  end

  def self.format_script(common_drug)
    hash = Hash.new()
    common_drug.each do |drug, count |
      hash["Drug: #{drug}"] = "Number of times prescribed: #{count}"
    end
    hash
  end
  #returns has of hospital_id as key. values are [medication_id, hospital_id] => number of times med was prescripted per hospital
  def self.most_med_per_hospital
    most_per_hospital = self.group(:medication_id, :hospital_id).count
    most_per_hospital.group_by { |mh, v| p mh.last }
  end

  #groups_drugs_by_hospital_and_quantities (hospital.id)63=>{(drug.id)1312=>(number of times prescribed)279, 8715=>267, 5764=>552, 3360=>581, 3940=>416
  def self.group_drug_by_hospital
    # hash_of_hospitals_drugs_counts
    hospital_hash = Hash.new(0)
    self.most_med_per_hospital.each do |hos, arr|
      h = Hash.new(0)
      arr.each do | med_id_arr, total|
        med_id = med_id_arr[0]
        drug_id = Medication.find_by(id: med_id).drug_id
        h[drug_id] += total
      end
      hospital_hash[hos] = h
    end
    hospital_hash
  end
end
