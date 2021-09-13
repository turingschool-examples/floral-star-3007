class CreateMechanicRides < ActiveRecord::Migration[5.2]
  def change
    create_table :mechanic_rides do |t|
      t.references :ride
      t.references :mechanic

      t.timestamps
    end
  end
end
