class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :title
      t.string :location
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
