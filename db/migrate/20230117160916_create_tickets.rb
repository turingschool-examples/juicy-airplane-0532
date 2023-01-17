class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :subject
      t.integer :age
      t.boolean :open
      t.references :employee, foreign_key: true
    end
  end
end
