module RedmineProjectPriority
  module IssuePatch
    def self.included(base)
      base.class_eval do
        # making the project priority available directly as an issue attribute
        # used for view queries and filters
        has_one :project_priority_id, :through => :project, :source => :priority
      end # base.class_eval
    end # self.included
  end # issues patch
end # project priority