class CreatePrescribers < ActiveRecord::Migration[5.1]
  def change
    create_table :prescribers do |t|
      t.string :prescriber_name

      t.timestamps
    end
  end
end
