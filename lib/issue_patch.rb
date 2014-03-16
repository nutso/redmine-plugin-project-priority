module RedmineProjectPriority
  module IssuePatch
    def self.included(base)
      base.class_eval do
        # making the project priority available directly as an issue attribute
        # used for view queries and filters
        def project_priority_id
          project.priority.id
        end 
      end # base.class_eval
    end # self.included
  end # issues patch
end # recurring task
