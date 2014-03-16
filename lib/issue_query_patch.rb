module RedmineProjectPriority
  module IssueQueryPatch
    def self.included(base)
      base.class_eval do


        # TODO inherit from IssueQuery, just add project priority
        self.available_columns = [
          QueryColumn.new(:id, :sortable => "#{Issue.table_name}.id", :default_order => 'desc', :caption => '#', :frozen => true),
          QueryColumn.new(:project, :sortable => "#{Project.table_name}.name", :groupable => true),
          QueryColumn.new(:tracker, :sortable => "#{Tracker.table_name}.position", :groupable => true),
          QueryColumn.new(:parent, :sortable => ["#{Issue.table_name}.root_id", "#{Issue.table_name}.lft ASC"], :default_order => 'desc', :caption => :field_parent_issue),
          QueryColumn.new(:status, :sortable => "#{IssueStatus.table_name}.position", :groupable => true),
          QueryColumn.new(:priority, :sortable => "#{IssuePriority.table_name}.position", :default_order => 'desc', :groupable => true),
          QueryColumn.new(:subject, :sortable => "#{Issue.table_name}.subject"),
          QueryColumn.new(:author, :sortable => lambda {User.fields_for_order_statement("authors")}, :groupable => true),
          QueryColumn.new(:assigned_to, :sortable => lambda {User.fields_for_order_statement}, :groupable => true),
          QueryColumn.new(:updated_on, :sortable => "#{Issue.table_name}.updated_on", :default_order => 'desc'),
          QueryColumn.new(:category, :sortable => "#{IssueCategory.table_name}.name", :groupable => true),
          QueryColumn.new(:fixed_version, :sortable => lambda {Version.fields_for_order_statement}, :groupable => true),
          QueryColumn.new(:start_date, :sortable => "#{Issue.table_name}.start_date"),
          QueryColumn.new(:due_date, :sortable => "#{Issue.table_name}.due_date"),
          QueryColumn.new(:estimated_hours, :sortable => "#{Issue.table_name}.estimated_hours"),
          QueryColumn.new(:done_ratio, :sortable => "#{Issue.table_name}.done_ratio", :groupable => true),
          QueryColumn.new(:created_on, :sortable => "#{Issue.table_name}.created_on", :default_order => 'desc'),
          QueryColumn.new(:closed_on, :sortable => "#{Issue.table_name}.closed_on", :default_order => 'desc'),
          QueryColumn.new(:relations, :caption => :label_related_issues),
          QueryColumn.new(:description, :inline => false),
          QueryColumn.new(:project_priority, :sortable => "#{ProjectPriority.table_name}.position", :default_order => 'desc', :groupable => true, :caption => :label_project_priority)
        ]



      end # base.class_eval
    end # self.included
  end # issues patch
end # recurring task
