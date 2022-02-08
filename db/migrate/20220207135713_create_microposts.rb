class CreateMicroposts < ActiveRecord::Migration[7.0]
  def change
    create_table :microposts do |t|
      t.string :content
      t.string :username

      t.timestamps
    end
  end
end
