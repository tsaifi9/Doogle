class RenameColumnInWord < ActiveRecord::Migration
  def change
    #reverting the previous name change
    rename_column :words, :value, :word
  end
end
