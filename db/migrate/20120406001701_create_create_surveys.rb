class CreateCreateSurveys < ActiveRecord::Migration
  def self.up
    create_table :create_surveys do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :create_surveys
  end
end
