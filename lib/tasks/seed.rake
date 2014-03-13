desc <<-END_DESC
Seed project priority data

Example:
  rake redmine:project_priority:seed RAILS_ENV=production
END_DESC
require File.expand_path(File.dirname(__FILE__) + "/../../../../config/environment")

namespace :redmine do
  namespace :project_priority do
    task :seed => :environment do
      puts "Seeding initial project priority values."
      # Same default values as for IssuePriority
      ProjectPriority.create!(:name => Redmine::I18n.l(:default_priority_low), :position => 1)
      ProjectPriority.create!(:name => Redmine::I18n.l(:default_priority_normal), :position => 2, :is_default => true)
      ProjectPriority.create!(:name => Redmine::I18n.l(:default_priority_high), :position => 3)
      ProjectPriority.create!(:name => Redmine::I18n.l(:default_priority_urgent), :position => 4)
      ProjectPriority.create!(:name => Redmine::I18n.l(:default_priority_immediate), :position => 5)
    end
  end
end
