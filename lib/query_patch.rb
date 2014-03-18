require 'redmine'

module RedmineProjectPriority
  module QueryPatch
    def self.included(base)
      # WHERE clause for associations
      def sql_for_field_with_association_support(field, operator, value, db_table, db_field, is_custom_filter=false)
        sql = sql_for_field_without_association_support(field, operator, value, db_table, db_field, is_custom_filter)

        
        
        
        sql
      end

      base.class_eval do
        alias_method_chain :sql_for_field, :association_support
      end # base.class_eval
    end # self.included
  end # query patch
end # project priority