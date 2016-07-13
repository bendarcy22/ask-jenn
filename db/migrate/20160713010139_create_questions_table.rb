class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions_tables do |t|
      t.text :body, null: false
      t.string :name, null: false
    end
  end
end
