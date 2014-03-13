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
    
    # Same default values as for IssuePriority
    ProjectPriority.create!(:name => :default_priority_low, :position => 1)
    ProjectPriority.create!(:name => :default_priority_normal, :position => 2, :is_default => true)
    ProjectPriority.create!(:name => :default_priority_high, :position => 3)
    ProjectPriority.create!(:name => :default_priority_urgent, :position => 4)
    ProjectPriority.create!(:name => :default_priority_immediate, :position => 5)
  end
end
