require 'csv'

namespace :import do

  task setup_script: :environment do
    ph = "prescription_history.csv"
    CSV.foreach(ph, headers: :true, header_converters: :symbol) do |row|
      Prescriber.find_or_create_by!(id: row[:prescriber_id],
        prescriber_name: row[:prescriber_name]
      )
      print '.'
      Hospital.find_or_create_by!(id: row[:hospital_id],
        hospital_name: row[:hospital_name]
      )
      print '-'
    end

    CSV.foreach(ph, headers: :true, header_converters: :symbol) do |row|
      if !row[:disease].match? /\A\d+\z/ # true = intger
        disease_id = Disease.find_by(name: row[:disease]).id
      else
        disease_id = row[:disease].to_i
      end
      Prescription.find_or_create_by!(id: row[:prescription_id],
        frequency_per_day: row[:frequency_per_day],
        days_supply: row[:days_supply],
        medication_id: row[:medication_id],
        prescriber_id: row[:prescriber_id],
        hospital_id: row[:hospital_id],
        disease_id: disease_id
      )
      print '*'
    end
    puts "database is created"
  end

end
