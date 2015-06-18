# redmine-plugin-project-priority

Redmine plugin that adds a priority field to projects, similar to issues, that can be used to filter issues as well as projects.

Released under GPLv2 in accordance with Redmine licensing.

## Features

Assign a priority at the project level, similar to issues. This project priority is available as a filter for issue lists -- e.g. show all issues
that are open and fall under a project with a high priority.

## Installation

Follow standard Redmine plugin installation -- (barely) modified from http://www.redmine.org/projects/redmine/wiki/Plugins

1. Copy or clone the plugin directory into #{RAILS_ROOT}/plugins/project_priority
   
   e.g. git clone https://github.com/nutso/redmine-plugin-project-priority.git project_priority

2. Rake the database migration (make a db backup before)

   e.g. rake redmine:plugins:migrate RAILS_ENV=production

3. Load seed data

   rake redmine:project_priority:seed RAILS_ENV=production

4. Restart Redmine (or web server)

You should now be able to see the plugin list in Administration -> Plugins.
     
## Configuration
     
N/A
   
## Upgrade or Migrate Plugin

Please check the Release Notes (ReleaseNotes.md) for substantive or breaking changes.

### Option 1: Git Pull
1. If you installed via git clone, you can just change to 
   the project_priority directory and do a git pull to get the update

2. Run database migrations (make a db backup before)

   rake redmine:plugins:migrate RAILS_ENV=production

3. Restart Redmine (or web server)

### Option 2: Remove and Re-install Plugin
1. Follow Remove or Uninstall Plugin instructions below
2. Follow Installation instructions above
   
## Remove or Uninstall Plugin

Follow standard Redmine plugin un-installation -- (barely) modified from http://www.redmine.org/projects/redmine/wiki/Plugins

1. Downgrade the database (make a db backup before)

   rake redmine:plugins:migrate NAME=project_priority VERSION=0 RAILS_ENV=production

2. Remove the plugin from the plugins folder (#{RAILS_ROOT}/plugins)

3. Restart Redmine (or web server)