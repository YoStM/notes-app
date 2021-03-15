class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.references :positionnotebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
