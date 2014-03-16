module RedmineProjectPriority
  module IssueQueryPatch
    def self.included(base)
      base.class_eval do


        # inherit from IssueQuery, just add project priority
        self.available_columns << QueryColumn.new(:project_priority, :sortable => "#{ProjectPriority.table_name}.position", :default_order => 'desc', :groupable => true, :caption => :label_project_priority)

      end # base.class_eval
    end # self.included
  end # issues patch
end # recurring task
