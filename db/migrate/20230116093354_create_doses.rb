class CreateDoses < ActiveRecord::Migration[7.0]
  def change
    create_table :doses do |t|
      t.text :description

      t.timestamps
    end
  end
end
