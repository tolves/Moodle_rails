class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.references :course, foregien_key: true
      t.timestamps
    end
  end
end
