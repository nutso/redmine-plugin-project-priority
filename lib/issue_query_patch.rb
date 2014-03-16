require 'redmine'

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
        self.available_columns << QueryAssociationColumn.new(:project_priority_id, :association => :project, :field => :project_priority_id, :sortable => "#{ProjectPriority.table_name}.position", :default_order => 'desc', :groupable => true, :caption => :label_project_priority)
      end # base.class_eval
    end # self.included
  end # issues patch
end # recurring task


class QueryAssociationColumn < QueryColumn
  def initialize(name, options)
    super(name, options)
    
    @association = options[:association]
    @field = options[:field]
    
    # TODO not sure if this is necessary (or functional)
    # def value(object)
    #   (object.send @association).send @field
    # end
    
    # TODO set self.groupable = association.column
  end
  
  def name
    "#{@association}.#{@field}"
  end
end

