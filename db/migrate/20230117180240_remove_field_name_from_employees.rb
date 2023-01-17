class RemoveFieldNameFromEmployees < ActiveRecord::Migration[5.2]
  def change
    remove_column :employees, :employee_ticket_id, :bigint
  end
end
