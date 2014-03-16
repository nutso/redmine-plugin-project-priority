module RedmineProjectPriority
  module IssueQueryPatch
    def self.included(base)
      def initialize_available_filters_with_project_priority_filter
        retval = initialize_available_filters_without_project_priority_filter
        add_available_filter "project_priority_id", :type => :list, :values => ProjectPriority.all.collect{|s| [s.name, s.id.to_s] }, :label => :label_project_priority
        retval
      end

      base.class_eval do
        alias_method_chain :initialize_available_filters, :project_priority_filter
        
        # inherit from IssueQuery, just add project priority
        self.available_columns << QueryColumn.new(:project_priority_id, :sortable => "#{ProjectPriority.table_name}.position", :default_order => 'desc', :groupable => true, :caption => :label_project_priority)
      end # base.class_eval
    end # self.included
  end # issues patch
end # recurring task
