class CreateOurnaropaDecisionsDecisions < ActiveRecord::Migration
  def change
    create_table :ournaropa_decisions_decisions do |t|
      t.string :title
      t.text :description
      t.string :author

      t.timestamps null: false
    end
  end
end
