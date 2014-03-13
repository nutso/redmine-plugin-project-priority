class AddProjectPriority < ActiveRecord::Migration
  def change
    begin
      add_column :projects, :priority_id, :integer
    rescue => ex
      say ex
    end
    
    begin
      add_index "projects", ["priority_id"], :name => "index_projects_on_priority_id"
    rescue => ex
      say ex
    end
  end
end
