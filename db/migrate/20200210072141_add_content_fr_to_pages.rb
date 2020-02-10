class AddContentFrToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :content_fr, :text, default: ""
  end
end
