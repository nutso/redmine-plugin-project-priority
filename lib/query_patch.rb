require 'redmine'

module RedmineProjectPriority
  module QueryPatch
    def self.included(base)
      # WHERE clause for associations
      def sql_for_field_with_association_support(field, operator, value, db_table, db_field, is_custom_filter=false)
        sql = sql_for_field_without_association_support(field, operator, value, db_table, db_field, is_custom_filter)

        # hard-coded for project priority
        if field == 'project_priority_id'
          db_table = 'projects'
          db_field = 'project_priority_id'
          
          case operator
          when "="
            if value.any?
              case type_for(field)
              when :integer
                sql = "#{db_table}.#{db_field} = #{value.first.to_i}"
              else
                sql = "#{db_table}.#{db_field} IN (" + value.collect{|val| "'#{connection.quote_string(val)}'"}.join(",") + ")"
              end
            else
              # IN an empty set
              sql = "1=0"
            end
          when "!"
            if value.any?
              sql = "(#{db_table}.#{db_field} IS NULL OR #{db_table}.#{db_field} NOT IN (" + value.collect{|val| "'#{connection.quote_string(val)}'"}.join(",") + "))"
            else
              # NOT IN an empty set
              sql = "1=1"
            end
          when "!*"
            sql = "#{db_table}.#{db_field} IS NULL"
          when "*"
            sql = "#{db_table}.#{db_field} IS NOT NULL"
          when "><"
            sql = "#{db_table}.#{db_field} BETWEEN #{value[0].to_f} AND #{value[1].to_f}"
          when "~"
            sql = "LOWER(#{db_table}.#{db_field}) LIKE '%#{connection.quote_string(value.first.to_s.downcase)}%'"
          when "!~"
            sql = "LOWER(#{db_table}.#{db_field}) NOT LIKE '%#{connection.quote_string(value.first.to_s.downcase)}%'"
          else
            raise "Unsupported query operator #{operator} for project_priority_id"
          end
        end        
        return sql
      end # sql_for_field_with_association_support

      base.class_eval do
        alias_method_chain :sql_for_field, :association_support
      end # base.class_eval
    end # self.included
  end # query patch
end # project priority