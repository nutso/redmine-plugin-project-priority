module RedmineProjectPriority
  class Hooks < Redmine::Hook::ViewListener
    # TODO project form hook -- :view_projects_form

    # View project priority on project 'Show' page
    # Other options include :view_projects_show_left, :view_projects_show_sidebar_bottom
    render_on :view_projects_show_right,
      :partial => 'projects/show_priority'
  end
end