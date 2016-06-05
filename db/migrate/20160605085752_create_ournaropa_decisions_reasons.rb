class CreateOurnaropaDecisionsReasons < ActiveRecord::Migration
  def change
    create_table :ournaropa_decisions_reasons do |t|

      t.timestamps null: false
    end
  end
end
