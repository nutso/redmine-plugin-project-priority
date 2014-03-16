module RedmineProjectPriority
  module IssuePatch
    def self.included(base)
      base.class_eval do
        # making the project priority available directly as an issue attribute
        # alias_attribute :project_priority, :project.priority
        def project_priority
          project.priority
        end 
        def project_priority=(incoming)
          project.priority=incoming
        end
      end # base.class_eval
    end # self.included
  end # issues patch
end # recurring task
