class CreateOperationalEscalations < ActiveRecord::Migration[7.1]
  def change
    create_table :operational_escalations do |t|
      t.string :escalation_level
      t.string :name
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
