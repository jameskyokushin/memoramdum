class CreateForms < ActiveRecord::Migration
  def self.up
    create_table :forms do |t|
      t.date :date_issued
      t.string :issued_to
      t.string :from
      t.string :subject
      t.text :why
      t.text :answer
      t.string :sign_by
      t.string :issued_by

      t.timestamps
    end
  end

  def self.down
    drop_table :forms
  end
end
