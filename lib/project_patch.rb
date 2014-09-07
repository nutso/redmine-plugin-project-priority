module RedmineProjectPriority
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        belongs_to :priority, :class_name => 'ProjectPriority', :foreign_key => 'project_priority_id'
        
        # TODO inherit this from project, just add project_priority_id
        safe_attributes 'name',
          'description',
          'homepage',
          'is_public',
          'identifier',
          'custom_field_values',
          'custom_fields',
          'tracker_ids',
          'issue_custom_field_ids',
          'project_priority_id'
      end # base.class_eval
    end # self.included
  end # project patch
end # project priority
