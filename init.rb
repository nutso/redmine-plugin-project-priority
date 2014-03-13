Redmine::Plugin.register :project_priority do
  name 'Project Priority'
  author 'Teresa N.'
  author_url 'https://github.com/nutso/'
  url 'https://github.com/nutso/redmine-plugin-project-priority'
  description 'Adds a priority field to projects, similar to issues, that can be used to rank and sort issues as well as projects.'
  version '0.0.1'
end


# TODO
# project form hook -- :view_projects_form
# show project hooks -- :view_projects_show_left
#                       :view_projects_show_right
#                       :view_projects_show_sidebar_bottom
# views/projects/index.api.rsb -- include the priority
# views/projects/show.api.rsb -- include the priority