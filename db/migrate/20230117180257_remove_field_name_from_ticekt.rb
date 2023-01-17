class RemoveFieldNameFromTicekt < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :employee_ticket_id, :bigint
  end
end
