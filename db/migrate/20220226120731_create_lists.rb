class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      # string型のtitleという名前のカラムを定義
      t.string :title
      # string型のbodyという名前のカラムを定義
      t.string :body

      t.timestamps
    end
  end
end
