class CreateJoinTableCharacterClassification < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :classifications do |t|
      t.index [:character_id, :classification_id]
      t.index [:classification_id, :character_id]
    end
  end
end
