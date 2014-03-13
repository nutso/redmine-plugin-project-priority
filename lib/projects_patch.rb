module RedmineProjectPriority
  module ProjectPatch
    def self.included(base)
      base.class_eval do
        belongs_to :priority, :class_name => 'ProjectPriority', :foreign_key => 'priority_id'
      end # base.class_eval
    end # self.included
  end # issues patch
end # recurring task
