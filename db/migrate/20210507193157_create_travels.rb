class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|
      t.string :name
      t.string :address
      t.belongs_to :user, index: true
      t.belongs_to :location, index: true

      t.timestamps
    end
  end
end
