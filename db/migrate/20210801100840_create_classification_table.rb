class CreateClassificationTable < ActiveRecord::Migration[6.0]
  def change
    create_table :classifications do |t|
      t.string :name
      t.string :description
      t.string :strike_stat
      t.string :might_stat
      t.string :dodge_stat
      t.string :gene_pool
    end
  end
end
