class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def self.up
    create_table :prescriptions, id: false do |t|
      t.integer :id, limit: 11
    end
  end
end
