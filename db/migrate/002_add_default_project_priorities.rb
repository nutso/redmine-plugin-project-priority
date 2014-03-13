class AddDefaultProjectPriorities < ActiveRecord::Migration
  def change
    # Same default values as for IssuePriority
    ProjectPriority.create!(:name => :default_priority_low, :position => 1)
    ProjectPriority.create!(:name => :default_priority_normal, :position => 2, :is_default => true)
    ProjectPriority.create!(:name => :default_priority_high, :position => 3)
    ProjectPriority.create!(:name => :default_priority_urgent, :position => 4)
    ProjectPriority.create!(:name => :default_priority_immediate, :position => 5)
  end
end
