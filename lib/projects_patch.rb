module RedmineProjectPriority
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        belongs_to :priority, :class_name => 'ProjectPriority', :foreign_key => 'project_priority_id'
        
        # TODO add to copy -- set priority -- or override safe_attributes to include priority
      end # base.class_eval
    end # self.included
  end # issues patch
end # recurring task
