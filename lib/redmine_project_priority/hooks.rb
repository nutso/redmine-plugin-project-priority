module RedmineProjectPriority
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_projects_form, :partial => 'projects/form_priority'

    # View project priority on project 'Show' page
    # Other options include :view_projects_show_left, :view_projects_show_sidebar_bottom
    render_on :view_projects_show_right, :partial => 'projects/show_priority'
  end
end

# TODO views/projects/index.api.rsb -- include the priority
# TODO views/projects/show.api.rsb -- include the priority