class AddColumnsToPrescription < ActiveRecord::Migration[5.1]
  def change
    add_column :prescriptions, :frequency_per_day, :integer
    add_column :prescriptions, :days_supply, :integer
    add_reference :prescriptions, :medication
    add_reference :prescriptions, :prescriber
    add_reference :prescriptions, :hospital
    add_reference :prescriptions, :disease
  end
end
