# view hooks
require_dependency 'redmine_project_priority/hooks'

Redmine::Plugin.register :project_priority do
  name 'Project Priority'
  author 'Teresa N.'
  author_url 'https://github.com/nutso/'
  url 'https://github.com/nutso/redmine-plugin-project-priority'
  description 'Adds a priority field to projects, similar to issues, that can be used to rank and sort issues as well as projects.'
  version '0.0.1'
end


# TODO
# views/projects/index.api.rsb -- include the priority
# views/projects/show.api.rsb -- include the priority