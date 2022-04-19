class AddAasmToUser < ActiveRecord::Migration[6.0]
  def change
    add_column(:users, :new_word_chain, :string)
  end
end
