module RedmineProjectPriority
  module ProjectsControllerPatch
    def self.included(base)
      base.class_eval do
        # No project controller hooks exist
        before_filter :set_project_priorities, :only => [ :new, :create, :edit, :update, :settings ]
        
        def set_project_priorities
         @project_priorities = ProjectPriority.active
        end
                
      end # base.class_eval
    end # self.included
  end # project controller patch
end # project priority
