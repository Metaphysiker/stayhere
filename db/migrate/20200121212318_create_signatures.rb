class CreateSignatures < ActiveRecord::Migration[6.0]
  def change
    create_table :signatures do |t|
      t.string :firstname, default: ""
      t.string :lastname, default: ""
      t.string :email, default: ""
      t.boolean :i_want_to_be_kept_up_to_date, default: false
      t.text :comment, default: ""

      t.timestamps
    end
  end
end
