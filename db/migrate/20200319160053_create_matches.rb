class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.string :name, null: false
      t.references :home_command, null: false
      t.references :guest_command, null: false

      t.timestamps
    end
  end
end
