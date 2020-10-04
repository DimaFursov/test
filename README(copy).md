#Project.includes(:tasks).unscoped.where(name: 'Garage').map do |project| project.tasks.unscope(:order).group(:name).order('count_name desc').having('count_name > 1').count(:name) end
      #Project.includes(:tasks).unscoped.where('projects.name = ?', 'Garage').map do |project| project.tasks.unscope(:order).group(:name, :status).order('count_name desc').having('count_name > 1').count(:name) end
#b = project.tasks.unscope(:order).group(:status).order(:project_id).having(status: true).having('count_status > 10').count(:status)
      #s = project.tasks.unscope(:order).group(:status).order('count_status desc').having('count_status > 10').count(:status)
      #b = project.tasks.unscope(:order).group(:status).order(:project_id).having(status: true).having('count_status > 10').count(:status)
      #q = project.tasks.limit(11).group(:status).order('task_status desc').having('task_status > 10').count(:status)
    #.unscope(:order).group(:name, :status).order('count_name desc').having('count_name > 1').count(:name)      
    #Project.unscoped.includes(:tasks).unscoped.map do |project| project.tasks.unscope(:order).group(:name, status: true).order('count_status desc').having('count_status > 10').count(:status) end
    #Project.unscoped.includes(:tasks).unscoped.map do |project| project.tasks.unscope(:order).having(status: true).order('count_name desc').limit(11) end
      # if Task.where('tasks.project_id = ?', project.id).limit(11).count(status: true) > 10 then
      # if project.tasks.limit(11).count(status: true) > 10 
      #Task.unscoped.where('status = ?', 'true')
      #Task.where('tasks.project_id = ?', project.id).limit(11).count(status: true)
      #q = project.tasks.group(:status).having(status: true)#.count(:status)
      #if project.tasks.where(status: true).count(:status) > 10
      #c = project.tasks.where(status: true).count(:status)
      #if hash(s) > 10 then

=begin
    render json: Project.find_by_sql("
      SELECT t.name, COUNT(*) as task_count, t.status 
      FROM tasks t, projects p 
      WHERE p.name='Garage' AND t.project_id = p.id 
      GROUP BY t.name, t.status HAVING count(*)>1 ORDER BY task_count")
=end          

 #5. get the list of all projects containing the 'a' letter in the middle of
  #the name, and show the tasks count near each project. Mentionthat there can exist projects without tasks and tasks with
  # project_id = NULL
  def list_projects_cont_a_middle
    projects = Project.includes(:tasks).unscoped.where("
      projects.name LIKE '%a%' AND projects.name NOT LIKE 'a%' AND projects.name NOT LIKE '%a'").map do |project|
      {
        projects: project.name,
        count_tasks: project.tasks.count
      }
    end
    projects.sort_by! { |x| x[:project_name]}  
    render json: projects
  end
=begin    
    render json: Project.find_by_sql("
      SELECT p.name as project_name, count(t.id) as count_tasks 
      FROM projects p LEFT JOIN tasks t on t.project_id = p.id 
      WHERE p.name LIKE '%a%' AND p.name NOT LIKE 'a%' AND p.name NOT LIKE '%a' GROUP BY project_name")
=end   

  #6. get the list of tasks with duplicate names. Order alphabetically
  def tasks_duplicate_name_asc
    tasks = Task.unscoped.select(:name).distinct.order(name: :asc).map do |task|
      {
        distinct_task_name: task.name #project.tasks
      }
    end 
    render json: tasks
    #render json: Project.find_by_sql("SELECT name FROM tasks GROUP BY name HAVING count(*)>1 ORDER BY name")
  end 

=begin
    render json: Project.find_by_sql("
      SELECT t.name, COUNT(*) as task_count, t.status 
      FROM tasks t, projects p 
      WHERE p.name='Garage' AND t.project_id = p.id 
      GROUP BY t.name, t.status HAVING count(*)>1 ORDER BY task_count")
=end    
  #7. get list of tasks having several exact matches of both name and status,
  #   from the project 'Garage'. Order by matches count
  def tasks_exact_matches_both_name_status_from_project_name_Garage  
  #'projects.name = ?', 'Garage'  
    projects = Project.includes(:tasks).unscoped.where('projects.name = ?', 'Garage').map do |project|
      count_group_name_status = project.tasks.unscope(:order).group(:name, :status).order('count_name desc').having('count_name > 1').count(:name)#:order#tasks_status#,:status
      # tasks_status
      #Project.includes(:tasks).unscoped.where(name: 'Garage').map do |project| project.tasks.unscope(:order).group(:name).order('count_name desc').having('count_name > 1').count(:name) end
      #Project.includes(:tasks).unscoped.where('projects.name = ?', 'Garage').map do |project| project.tasks.unscope(:order).group(:name, :status).order('count_name desc').having('count_name > 1').count(:name) end
      {
        project_name: project.name,
        garage_tasks_count_desc: count_group_name_status,
      }
    end
    render json: projects
  end    

  #8. - get the list of project names having more than 10 tasks in status'completed'. Order by project_id
  def list_project_more_10_tasks_true
=begin    
    render json: Project.find_by_sql("
      SELECT p.name 
      FROM projects p WHERE EXISTS (SELECT `project_id` FROM tasks t 
      WHERE p.id=t.project_id GROUP BY `project_id` AND t.status='true' HAVING count(*)>10) ORDER BY p.id ASC")  
=end

    projects = Project.includes(:tasks).unscoped.map do |project|
      #q = project.tasks.limit(11).group(:status).order('task_status desc').having('task_status > 10').count(:status)
    #.unscope(:order).group(:name, :status).order('count_name desc').having('count_name > 1').count(:name)      
    #Project.unscoped.includes(:tasks).unscoped.map do |project| project.tasks.having('status = ?', 'true'>9) end
    #Project.unscoped.includes(:tasks).unscoped.map do |project| project.tasks.unscope(:order).having(status: true).order('count_name desc').limit(11) end
      # if Task.where('tasks.project_id = ?', project.id).limit(11).count(status: true) > 10 then
      # if project.tasks.limit(11).count(status: true) > 10 
      a = Task.unscoped.where('status = ?', 'true')
      #Task.where('tasks.project_id = ?', project.id).limit(11).count(status: true)
      q = project.tasks.group(:status).having(status: true)#.count(:status)
      #if project.tasks.where(status: true).count(:status) > 10
      c = project.tasks.where(status: true).count(:status)
      {
        project_id: project.id,
        project_name: project.name,
        pr_c_t: project.tasks.count,
        q: q,
        a: a,
        c: c #0
      }
      #end
    end
    #projects = projects.compact
    #projects.sort_by! { |hsh| -hsh[:project_id]}
    render json: projects
  end  

heroku run rake db:migrate
 ›   Warning: heroku update available from 7.43.1 to 7.43.2.
Running rake db:migrate on ⬢ secure-shore-15920... up, run.8703 (Free)
   (1.2ms)  SELECT pg_try_advisory_lock(2294364152804584770)
   (2.0ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
Migrating to CreateUsers (20200731120805)
   (1.1ms)  BEGIN
== 20200731120805 CreateUsers: migrating ======================================
-- create_table(:users)
   (22.5ms)  CREATE TABLE "users" ("id" bigserial primary key, "name" character varying, "email" character varying, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL)
   -> 0.0236s
== 20200731120805 CreateUsers: migrated (0.0237s) =============================

  ActiveRecord::SchemaMigration Create (1.3ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20200731120805"]]
   (3.9ms)  COMMIT
Migrating to AddIndexToUsersEmail (20200731132108)
   (1.1ms)  BEGIN
== 20200731132108 AddIndexToUsersEmail: migrating =============================
-- add_index(:users, :email, {:unique=>true})
   (4.1ms)  CREATE UNIQUE INDEX  "index_users_on_email" ON "users"  ("email")
   -> 0.0108s
== 20200731132108 AddIndexToUsersEmail: migrated (0.0110s) ====================

  ActiveRecord::SchemaMigration Create (1.6ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20200731132108"]]
   (2.0ms)  COMMIT
Migrating to AddPasswordDigestToUsers (20200731132535)
   (1.9ms)  BEGIN
== 20200731132535 AddPasswordDigestToUsers: migrating =========================
-- add_column(:users, :password_digest, :string)
   (1.4ms)  ALTER TABLE "users" ADD "password_digest" character varying
   -> 0.0017s
== 20200731132535 AddPasswordDigestToUsers: migrated (0.0018s) ================

  ActiveRecord::SchemaMigration Create (3.9ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20200731132535"]]
   (1.8ms)  COMMIT
Migrating to AddRememberDigestToUsers (20200801130637)
   (1.0ms)  BEGIN
== 20200801130637 AddRememberDigestToUsers: migrating =========================
-- add_column(:users, :remember_digest, :string)
   (3.0ms)  ALTER TABLE "users" ADD "remember_digest" character varying
   -> 0.0033s
== 20200801130637 AddRememberDigestToUsers: migrated (0.0034s) ================

  ActiveRecord::SchemaMigration Create (2.2ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20200801130637"]]
   (2.2ms)  COMMIT
Migrating to CreateProjects (20200805083217)
   (1.1ms)  BEGIN
== 20200805083217 CreateProjects: migrating ===================================
-- create_table(:projects)
   (12.3ms)  CREATE TABLE "projects" ("id" bigserial primary key, "name" character varying, "user_id" bigint, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL, CONSTRAINT "fk_rails_b872a6760a"
FOREIGN KEY ("user_id")
  REFERENCES "users" ("id")
)
   (4.1ms)  CREATE  INDEX  "index_projects_on_user_id" ON "projects"  ("user_id")
   -> 0.0210s
-- add_index(:projects, [:user_id, :created_at])
   (4.0ms)  CREATE  INDEX  "index_projects_on_user_id_and_created_at" ON "projects"  ("user_id", "created_at")
   -> 0.0093s
== 20200805083217 CreateProjects: migrated (0.0306s) ==========================

  ActiveRecord::SchemaMigration Create (1.2ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20200805083217"]]
   (2.0ms)  COMMIT
Migrating to CreateTasks (20200817134816)
   (1.1ms)  BEGIN
== 20200817134816 CreateTasks: migrating ======================================
-- create_table(:tasks)
   (7.5ms)  CREATE TABLE "tasks" ("id" bigserial primary key, "name" character varying, "status" boolean, "priority" integer, "deadline" timestamp, "project_id" bigint, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL, CONSTRAINT "fk_rails_02e851e3b7"
FOREIGN KEY ("project_id")
  REFERENCES "projects" ("id")
)
   (3.1ms)  CREATE  INDEX  "index_tasks_on_project_id" ON "tasks"  ("project_id")
   -> 0.0151s
-- add_index(:tasks, [:project_id, :created_at])
   (3.7ms)  CREATE  INDEX  "index_tasks_on_project_id_and_created_at" ON "tasks"  ("project_id", "created_at")
   -> 0.0077s
== 20200817134816 CreateTasks: migrated (0.0230s) =============================

  ActiveRecord::SchemaMigration Create (1.3ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20200817134816"]]
   (2.6ms)  COMMIT
Migrating to AddPositionToTasks (20200913182905)
   (2.4ms)  BEGIN
== 20200913182905 AddPositionToTasks: migrating ===============================
-- add_column(:tasks, :position, :integer)
   (1.9ms)  ALTER TABLE "tasks" ADD "position" integer
   -> 0.0022s
== 20200913182905 AddPositionToTasks: migrated (0.0023s) ======================

  ActiveRecord::SchemaMigration Create (1.2ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20200913182905"]]
   (2.1ms)  COMMIT
  ActiveRecord::InternalMetadata Load (1.4ms)  SELECT  "ar_internal_metadata".* FROM "ar_internal_metadata" WHERE "ar_internal_metadata"."key" = $1 LIMIT $2  [["key", "environment"], ["LIMIT", 1]]
   (1.1ms)  BEGIN
  ActiveRecord::InternalMetadata Create (1.4ms)  INSERT INTO "ar_internal_metadata" ("key", "value", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "key"  [["key", "environment"], ["value", "production"], ["created_at", "2020-09-30 08:15:58.200158"], ["updated_at", "2020-09-30 08:15:58.200158"]]
   (1.9ms)  COMMIT
   (1.2ms)  SELECT pg_advisory_unlock(2294364152804584770)




  def up
      drop_table :users

      create_table :users do |t|
      t.string :name
      #...

      t.timestamps
  end

# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count

# Specifies the `port` that Puma will listen on to receive requests; default is 3000.
#
port        ENV.fetch("PORT") { 3000 }

# Specifies the `environment` that Puma will run in.
#
environment ENV.fetch("RAILS_ENV") { "development" }

# Specifies the number of `workers` to boot in clustered mode.
# Workers are forked webserver processes. If using threads and workers together
# the concurrency of the application would be max `threads` * `workers`.
# Workers do not work on JRuby or Windows (both of which do not support
# processes).
#
# workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# Use the `preload_app!` method when specifying a `workers` number.
# This directive tells Puma to first boot the application and load code
# before forking the application. This takes advantage of Copy On Write
# process behavior so workers use less memory.
#
# preload_app!

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart




Панель с заголовком bootstrap

нет смысла инициализировать если ты с ним никак не взаимодействуешь
 не все в куче
a = b.get_smth(b)
c = a.map{i.test}
return {
  key1: a,
  key2: b
}

=begin       
    projects = Project.includes(:tasks).unscoped.map do |project|

      #q = project.tasks.limit(11).group(:status).order('task_status desc').having('task_status > 10').count(:status)
    #.unscope(:order).group(:name, :status).order('count_name desc').having('count_name > 1').count(:name)      
    #Project.unscoped.includes(:tasks).unscoped.map do |project| project.tasks.having('status = ?', 'true'>9) end
    #Project.unscoped.includes(:tasks).unscoped.map do |project| project.tasks.unscope(:order).having(status: true).order('count_name desc').limit(11) end
      # if Task.where('tasks.project_id = ?', project.id).limit(11).count(status: true) > 10 then
      # if project.tasks.limit(11).count(status: true) > 10 
      a = Task.unscoped.where('status = ?', 'true')
      #Task.where('tasks.project_id = ?', project.id).limit(11).count(status: true)
      q = project.tasks.group(:status).having(status: true)#.count(:status)
      #if project.tasks.where(status: true).count(:status) > 10
      c = project.tasks.where(status: true).count(:status)
      {
        project_id: project.id,
        project_name: project.name,
        pr_c_t: project.tasks.count,
        q: q,
        a: a,
        c: c #0
      }
      #end
    end
    #projects = projects.compact
    #projects.sort_by! { |hsh| -hsh[:project_id]}
    render json: projects
=end    


Project.includes(:tasks).unscoped.where('projects.name = ?', 'Garage').map do |project| project.tasks.unscope(:order).group(:name, :status).order('count_name desc').having('count_name > 1').count(:name) end
  Project Load (0.6ms)  SELECT "projects".* FROM "projects" WHERE (projects.name = 'Garage')
   (1.3ms)  SELECT COUNT("tasks"."name") AS count_name, "tasks"."name" AS tasks_name, "tasks"."status" AS tasks_status FROM "tasks" WHERE "tasks"."project_id" = ? GROUP BY "tasks"."name", "tasks"."status" HAVING (count_name > 1) ORDER BY count_name desc  [["project_id", 4]]
 => [{["truetaskGarage", true]=>3, ["taskGarage", false]=>2}]






//= link projects.js
//= link tasks.js
// app/assets/javascripts/tasks.js
// app/assets/javascripts/projects.js

//= link_directory app/assets/javascripts/tasks
//= link_directory app/assets/javascripts/projects

//= link application.css
//= link custom.css.scss
//= link application.js
//= link_tree ../images
//= link_directory ../javascripts .js
//= link_directory ../stylesheets .css

//= link_tree ../images
//= link_directory ../javascripts .js
//= link_directory ../stylesheets .css



----
//= link_directory app/assets/javascripts/tasks.js
//= link_directory app/assets/javascripts/projects.js
//= require app/assets/javascripts/tasks
//= require app/assets/javascripts/projects

DEPRECATION WARNING: Leaving `ActiveRecord::ConnectionAdapters::SQLite3Adapter.represent_boolean_as_integer`
set to false is deprecated. SQLite databases have used 't' and 'f' to serialize
boolean values and must have old data converted to 1 and 0 (its native boolean
serialization) before setting this flag to true. Conversion can be accomplished
by setting up a rake task which runs

  ExampleModel.where("boolean_column = 't'").update_all(boolean_column: 1)
  ExampleModel.where("boolean_column = 'f'").update_all(boolean_column: 0)

for all models and all boolean columns, after which the flag must be set to
true by adding the following to your application.rb file:

  Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
 (called from instance_eval at /home/nomid/.rvm/gems/ruby-2.6.3/gems/activesupport-5.2.2/lib/active_support/lazy_load_hooks.rb:71)
Started GET "/" for 127.0.0.1 at 2020-09-29 19:31:41 +0300
   (0.1ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
Processing by StaticPagesController#home as HTML
  Rendering static_pages/home.html.erb within layouts/application
  Rendered static_pages/home.html.erb within layouts/application (2.5ms)
Completed 500 Internal Server Error in 830ms (ActiveRecord: 0.0ms)


      #garage_id = project.id
      #garage_tasks_distinct = Task.where('tasks.project_id = ?', garage_id).select(:name, :status).distinct      
      # Order by matches count
      #count = Task.where('tasks.project_id = ?', garage_id).select(:name, :status).distinct.count(:name, :status)
     
      #count_number = Task.unscoped.where('tasks.project_id = ?', garage_id).group(:name, :status).count(:name, :status)
      #count_number1 = Task.unscoped.where('tasks.project_id = ?', garage_id).group(:name, :status).order(:name, :status).count
      
      #.order(status: :asc)
      # .having('count(*)>1')#.group('count')
      
      #tasks_where_name_status = project.tasks.where(status: true)
      # .count(:name, :status)
      # project.tasks.group...count...
      # group...order...count
      # a = project.tasks.group...count...
      #count_group_name_status = project.tasks.group(:name, :status).order('count_id asc').count('id')
      #count_group_name_status = project.tasks.group(:name, :status).count(:name, :status)

      #count_group_name_status = project.tasks.group(:name, :status).order(:name, :status).count
      #w = project.tasks.unscoped.where('tasks.project_id = ?', garage_id).group(:name, :status).order(:name, :status).count
      #  group ("recommended_tor_type_id", "recommended_for_types.name").count
      #  Tag.select("tag, count(*) as total_count").group("tag").reverse_order
      # Person.select("id, age").group(:id, :age).having("count(id) > 1").order("age desc")
      # w = project.tasks.select("name, status").group(:name, :status)
      # w = project.tasks.select("tasks.name, tasks.status").group(:name, :status).having("count(id) > 1")
      # projects = Project.includes(:tasks).unscoped.where('projects.name = ?', 'Garage').map do |project| a = project.tasks.group(:name, :status).order(:name, :status).count end
      # projects = Project.includes(:tasks).unscoped.where('projects.name = ?', 'Garage').map do |project| a = project.tasks.unscoped.where('projects.name = ?', 'Garage').group(:name, :status).order('count_id asc').count('id') end
      
      #project.tasks.limit(11).count(status: true)
      #Task.where('tasks.project_id = ?', project.id).limit(11).count(status: true)
  
#8. - get the list of project names having more than 10 tasks in status'completed'. Order by project_id
  def list_project_more_10_tasks_true
=begin    
    render json: Project.find_by_sql("
      SELECT p.name 
      FROM projects p WHERE EXISTS (SELECT `project_id` FROM tasks t 
      WHERE p.id=t.project_id GROUP BY `project_id` AND t.status='true' HAVING count(*)>10) ORDER BY p.id ASC")  
=end
    projects = Project.unscoped.includes(:tasks).unscoped.map do |project|
      # project_id = project.id
      # .limit(10).count
      #  Task.limit(10).count(status: true)
      if Task.where('tasks.project_id = ?', project.id).limit(11).count(status: true) > 10 then
      {
        project_id: project.id,
        project_name: project.name,
      }
      end
    end
    #  remove null 
    projects = projects.compact
    projects.sort_by! { |hsh| -hsh[:project_id]}
    render json: projects
  end  

    #  Project.includes(:tasks).where("'tasks.status=true'").references(:tasks)
    # => projects = Project.includes(:tasks).where('tasks.name = ?', 'Garage').map do |project|
    #  Project.includes(:tasks).where("'projects.name = Garage' AND 'tasks.status=true'")

=begin
  tasks = Task.where("tasks.project_id = 4").select(:name, :status).distinct.map do |task|
        
        {
          distinct_task_name: task.name,
          distinct_task_status: task.status,
          project_id: project.id,
          
        }
        end       
        b = project.tasks.each do |task| 
            {
              #task: task.distinct.count(:name, :status)
            }
            end
=end    
    

      #.calculate(:count, :all)
      # User.joins(:topics).where(topics: { id: [1, 2, 3] }).group('users.id').having('count(distinct topics.id) = 3')
      #@products = @products.joins(:tasks).where('tasks.id' => project.id).group('projects.id')
      #.having("count(tasks.id) >= ?",area_ids.count) unless area_ids.blank?
      #@products = @products.joins(:tasks).where('surfaces.id' => surface_ids).group('products.id')
      #.having("count(surfaces.id) >= ?",surface_ids.count) unless surface_ids.blank?
      # projects = Project.includes(:tasks)
      # UserVideoWatching.where("created_at >= ? AND user_id != ?",1.month.ago, User.elephant.id)
      #.group("DATE(created_at)").reorder('created_at').count
      # UserVideoWatching.where("created_at >= ? AND user_id != ?",1.month.ago, User.elephant.id)
      #.group("DATE(created_at)").reorder('created_at').select('COUNT(DISTINCT user_id) AS count_all, DATE(created_at) AS date_created')
      # Task.having('count(*)>1').group('project_id')


#render json: Project.find_by_sql("
    #  SELECT t.name, COUNT(*) as task_count, t.status 
    #  FROM tasks t, projects p 
    #  WHERE p.name='Garage' AND t.project_id = p.id 
    #  GROUP BY t.name, t.status HAVING count(*)>1 ORDER BY task_count")

    #  Project.includes(:tasks).where("'tasks.status=true'").references(:tasks)
    # => projects = Project.includes(:tasks).where('tasks.name = ?', 'Garage').map do |project|
    #  Project.includes(:tasks).where("'projects.name = Garage' AND 'tasks.status=true'")

=begin
  tasks = Task.where("tasks.project_id = 4").select(:name, :status).distinct.map do |task|
        
        {
          distinct_task_name: task.name,
          distinct_task_status: task.status,
          project_id: project.id,
          
        }
        end       
        b = project.tasks.each do |task| 
            {
              #task: task.distinct.count(:name, :status)
            }
            end
=end    
    

      #.calculate(:count, :all)
      # User.joins(:topics).where(topics: { id: [1, 2, 3] }).group('users.id').having('count(distinct topics.id) = 3')
      #@products = @products.joins(:tasks).where('tasks.id' => project.id).group('projects.id')
      #.having("count(tasks.id) >= ?",area_ids.count) unless area_ids.blank?
      #@products = @products.joins(:tasks).where('surfaces.id' => surface_ids).group('products.id')
      #.having("count(surfaces.id) >= ?",surface_ids.count) unless surface_ids.blank?
      # projects = Project.includes(:tasks)
      # UserVideoWatching.where("created_at >= ? AND user_id != ?",1.month.ago, User.elephant.id)
      #.group("DATE(created_at)").reorder('created_at').count
      # UserVideoWatching.where("created_at >= ? AND user_id != ?",1.month.ago, User.elephant.id)
      #.group("DATE(created_at)").reorder('created_at').select('COUNT(DISTINCT user_id) AS count_all, DATE(created_at) AS date_created')
      # Task.having('count(*)>1').group('project_id')

=begin  
  #4. get the tasks for all projects having the name beginning with "N" letter
  def tasks_projects_name_beginning_n
    projects = Project.includes(:tasks).unscoped.where("projects.name LIKE 'N%'").map do |project|
      a = project.tasks.each do |task| 
        {
          task:task
        }
      end
      {
        project_name: project.name,
        tasks: project.tasks
      }
    end
    render json: projects
  end 

    projects = Project.includes(:tasks).unscoped.where("projects.name LIKE 'N%'").map do |project|
      a = project.tasks.each do |task| 
        {
          task:task
        }
      end
      {
        project_name: project.name,
        tasks: a
        #project.tasks.each do |task| 
        #{
        #  task:task
        #}
        #end
      }
    end
    render json: projects
  end  
=end  
=begin

    tasks = Task.unscoped.select(:name, :status).distinct.order(name: :asc).map do |task|
      {
        distinct_task_name: task.name,
        distinct_task_status: task.status
      }
    end  
        
    render json: tasks
=end  

=begin  
  #4. get the tasks for all projects having the name beginning with "N" letter
  def tasks_projects_name_beginning_n
    projects = Project.includes(:tasks).unscoped.where("projects.name LIKE 'N%'").map do |project|
      a = project.tasks.each do |task| 
        {
          task:task
        }
      end
      {
        project_name: project.name,
        tasks: project.tasks
      }
    end
    render json: projects
  end 

    projects = Project.includes(:tasks).unscoped.where("projects.name LIKE 'N%'").map do |project|
      a = project.tasks.each do |task| 
        {
          task:task
        }
      end
      {
        project_name: project.name,
        tasks: a
        #project.tasks.each do |task| 
        #{
        #  task:task
        #}
        #end
      }
    end
    render json: projects
  end  
=end  


#3. get the count of all tasks in each project, order by projects names
  def all_count_tasks_project_order_projects_name
    projects = Project.includes(:tasks).map do |project|
      {
        tasks_count: project.tasks.count,
        project_name: project.name
      } 
    end
    projects.sort_by! { |x| x[:project_name]}  
    render json: projects
=begin    
    render json: Project.find_by_sql("SELECT p.name as project_name, count(t.id) as count_tasks 
      FROM projects p LEFT JOIN tasks t ON  t.project_id = p.id  GROUP BY project_name ORDER BY project_name")
=end      
  end  

  #4. get the tasks for all projects having the name beginning with "N" letter
  def tasks_projects_name_beginning_n
  projects = Project.includes(:tasks).unscoped.where("projects.name LIKE 'N%'").map do |project|
      {
      project_name: project.name,
      tasks:
        project.tasks.each do |task| 
        {
          task:task
        }
        end
      }
    end
    
    render json: projects#[:project_name ,:tasks_names ]    
  end      
=begin    
    render json: Project.find_by_sql("
      SELECT t.name as task_name, p.name as project_name 
      FROM tasks t, projects p 
      WHERE p.name LIKE 'N%' AND t.project_id = p.id")
=end      

  #5. get the list of all projects containing the 'a' letter in the middle of
  #the name, and show the tasks count near each project. Mentionthat there can exist projects without tasks and tasks with
  # project_id = NULL
  def list_projects_cont_a_middle
    projects = Project.includes(:tasks).unscoped.where("
      projects.name LIKE '%a%' AND projects.name NOT LIKE 'a%' AND projects.name NOT LIKE '%a'").map do |project|
      {
        projects: project.name,
        count_tasks: project.tasks.count
      }
    end
    projects.sort_by! { |x| x[:project_name]}  
    render json: projects
  end
=begin    
    render json: Project.find_by_sql("
      SELECT p.name as project_name, count(t.id) as count_tasks 
      FROM projects p LEFT JOIN tasks t on t.project_id = p.id 
      WHERE p.name LIKE '%a%' AND p.name NOT LIKE 'a%' AND p.name NOT LIKE '%a' GROUP BY project_name")
=end      
#6. get the list of tasks with duplicate names. Order alphabetically
  def tasks_duplicate_name_asc
    tasks = Task.unscoped.select(:name).distinct.order(name: :asc).map do |task|
      {
        distinct_task_name: task.name
      }
    end  
    projects = Project.includes(:tasks).unscoped.map do |project|
      {
        tasks: project.tasks#counter
      }
    end
    
    render json: tasks
    #render json: Project.find_by_sql("SELECT name FROM tasks GROUP BY name HAVING count(*)>1 ORDER BY name")
  end  
#1. get all statuses, not repeating, alphabetically ordered
  def all_status_asc
    render json: Task.unscoped.select(:status).distinct.order(status: :asc)
    #Task.unscoped.order(status: :asc)
  end

=begin

  #conditions = (range.first..range.last).to_a.map{ |letter| " name ILIKE '#{letter}%' " }.join('OR')
  #Item.where(conditions)
  #letters = ['N']
  #Project.includes(:tasks).where("substr(name, 1, 1) IN (?)", letters)
  #letters = ['N']
  projects = Project.includes(:tasks).where("substr(name, 1, 1) IN (?)", letters).map do |project|
      {
      project_name: project.name,
        
      tasks_names:
        if project.name.match(/^N/) 
          project.tasks.each do |task|
          {
            task:task
          }
          end
        end
      }
    end
    
    render json: projects#[:project_name ,:tasks_names ]  

  #projects = projects.where.not(project_name: [nil, ""], tasks_names: [nil, ""])
    #projects = projects.reject! { |x| x.nil? } 
    #.compact
    #projects.delete_if { |k, v| v.nil? || v.empty? }
    #projects1 = projects.compact!

  range = ['N']
  projects = Project.includes(:tasks).where(range.first..range.last).to_a.map do |project| 
      {
      project_name: project.name,
        
      tasks_names:
        if project.name.match(/^N/) 
          project.tasks.each do |task|
          {
            task:task
          }
          end
        end
      }.join('OR')
    end

  letters = ['N']
  projects = Project.includes(:tasks).where("substr(name, 1, 1) IN (?)", letters).map do |project|
      {
      project_name: project.name,
        
      tasks_names:
        if project.name.match(/^N/) 
          project.tasks.each do |task|
          {
            task:task
          }
          end
        end
      }
    end

  projects = Project.includes(:tasks).map do |project|
      {
      project_name: project.name,
        
      tasks_names:
        if project.name.match(/^N/) 
          project.tasks.each do |task|
          {
            task:task
          }
          end
        end
      }
    end

    render json: Project.find_by_sql("
      SELECT t.name as task_name, p.name as project_name 
      FROM tasks t, projects p 
      WHERE p.name LIKE 'N%' AND t.project_id = p.id")
=end 

=begin
 => #<Enumerator: [#<Project id: nil, name: "Et odio blanditiis eos sint nulla minus in repella...">,
  #<Project id: nil, name: "Necessitatibus in autem et ut impedit perferendis ...">, 
  #<Project id: nil, name: "Est corporis consectetur molestiae ea asperiores.">,
   #<Project id: nil, name: "Garage">]:map> 

 projects = Project.includes(:tasks).map do |project|
      {
      project_name: if project.name.match(/^N/) 
          then project.name
          end,
        
      tasks_names:
        if project.name.match(/^N/) 
          then 
          project.tasks.each do |task|
          {
            task:task
          }
          end
        end
      }
    end
    #projects = projects.where.not(project_name: [nil, ""], tasks_names: [nil, ""])
    
  
    render json: projects#[:project_name ,:tasks_names ]
    #.where.not(name: [nil, ""])

    projects.each do |key,value|
      count = 0
      if value == nil
        projects[count] = projects.delete(key)
        count += 1
      end
    end
    #=~ %r"abc"
    #'posts.name = ?', 'example'
    #posts: { name: 'example' }
    
    #Project.includes(:tasks).where(tasks: { name: 'Quos' })
    #Project.includes(:tasks).where('projects.name = ?', 'Necessitatibus.')
    #REGEX = /^N/
    #.where("table_column LIKE :prefix", prefix: "#{keyword}%")
    #projects = Project.includes(:tasks).where(projects: { name: conditions }).map do |project|
=end      
  #range = [ 'N' ]
  #conditions = (range.first..range.last).to_a.map{ |letter| '#{letter}%' }.join('OR')
  #Item.where(conditions)
  #letters = ('N').to_a
  #Item.where("substr(name, 1, 1) IN (?)", letters)
  #Item.where("substr(name, 1, 1) in ('N')")
  #conditions = (range.first..range.last).to_a.map{ |letter| " name ILIKE '#{letter}%' " }.join('OR')
  #Item.where(conditions)
=begin
    #2. get the count of all tasks in each project, order by tasks count descending   
    render json: Project.find_by_sql("SELECT p.name as project_name, count(t.id) as count_tasks 
      FROM projects p LEFT JOIN tasks t ON  t.project_id = p.id  GROUP BY project_name ORDER BY count_tasks DESC")
      #[{ name: 'text', count: 1234 },{}...]
      #sort_array = projects.sort_by { |hsh| -hsh[:tasks_count] }#.reverse!
=end
def all_tasks_count_in_project_desc
    projects = Project.includes(:tasks).map do |project|
      {
        tasks_count: project.tasks.count,
        project_name: project.name
      }
    end
    
    projects.sort_by! { |hsh| -hsh[:tasks_count]}
    render json: projects
  end
  
bundle exec guard init
22:27:48 - INFO - Writing new Guardfile to /home/nomid/workspace/simple_todo_lists/Guardfile
22:27:48 - INFO - minitest guard added to Guardfile, feel free to edit it
/users/show
<% provide(:title, @user.name) %>
<div class="row">
<p>
  <strong><i>Name:</i>:</strong>
  <%= current_user.name %>
</p>
<p>
  <strong>Email:</strong>
  <%= @user.email %>
</p>

<div class="projectsN">
    <% if @user.projects.any? %>
    <h3>Projects (<%= @user.projects.count %>)</h3>
    <ol class="projects">
      <%= render @projects %>
    </ol>
    <% end %>    
</div>
</div>

    #Project.unscoped.select(:name).order(name: :desc)
    #Task.where(:id=task.project_id).count
    #Task.where(:project_id => id).select("COUNT(Task)")
    #Task.where(:project_id => id).select("COUNT(Task.count) AS count_task").order(name: :desc) #.group(:title)
    #TAsk.count
rails db -p
    #render json: Task.select(:name, :status).order(name: :asc).unscoped
    #render json: Task.select(:name, :status).order(name: :asc)
        #SELECT DISTINCT status FROM tasks ORDER BY status
=begin
SELECT p.name
FROM projects p
INNER JOIN (
  SELECT `project_id`
    FROM tasks
    GROUP BY `project_id`
    WHERE `status` 
    AND
    HAVING COUNT(`id`) > 10
) `t` ON `t`.`project_id` = `p`.`id`
ORDER BY `p`.`id` ASC
=end
  #SELECT `project_id`
  #SELECT p.name FROM projects p WHERE EXISTS (SELECT 1 FROM tasks t 
  WHERE p.id=t.project_id AND t.status="completed" HAVING count(*)>10) ORDER BY p.id
=begin
SELECT `p`.`name`
FROM `projects` `p`
INNER JOIN (
  SELECT `project_id`
    FROM `tasks`
    GROUP BY `project_id`
    WHERE `status` = "true"
    HAVING COUNT(`id`) > 10
) `t` ON `t`.`project_id` = `p`.`id`
ORDER BY `p`.`id` ASC

  Get the count of all tasks in each project, order by tasks count descending.
  SELECT p.name as project_name, count(t.id) as count_tasks FROM projects p 
  LEFT JOIN tasks t ON  t.project_id = p.id  GROUP BY project_name ORDER BY count_tasks DESC
  Get the count of all tasks in each project, order by project names.
  SELECT p.name as project_name, count(t.id) as count_tasks FROM projects p LEFT JOIN tasks t ON  t.project_id = p.id  GROUP BY project_name ORDER BY project_name
  Get the tasks for all projects having the name beginning with “N” letter.
  SELECT t.name as task_name, p.name as project_name FROM tasks t, projects p WHERE p.name LIKE "N%" AND t.project_id = p.id
  Get the list of all projects containing the “a” letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL.
  SELECT p.name as project_name, count(t.id) as count_tasks FROM projects p LEFT JOIN tasks t on t.project_
  

SELECT * 
FROM `tasks`  
INNER JOIN(
    SELECT `name`  
    FROM `tasks`  
    GROUP BY `name`  
    HAVING COUNT(`name`) > 1  
) `temp` ON `tasks`.`name` = `temp`.`name`
ORDER BY `tasks`.`name` ASC

get the list of tasks having several exact matches of both name and status, from the project 'Garage'. Order by matches count
SELECT `t`.`name`, `t`.`status`, COUNT(`t`.`name`) `c`
FROM `tasks` `t`
INNER JOIN `projects` `p` ON `t`.`project_id` = `p`.`id`
INNER JOIN (
  SELECT CONCAT(`name`, `status`) `ns`
    FROM `tasks`
    GROUP BY `ns`
    HAVING COUNT(`ns`) > 1
) `temp` ON CONCAT(`t`.`name`, `t`.status) = `temp`.`ns`
WHERE `p`.`name` = 'Garage'
GROUP BY `t`.`name`, `t`.`status`
ORDER BY `c` ASC


=end
=begin
  render json: Project.find_by_sql("SELECT `p`.`name`
  FROM `projects` `p` INNER JOIN ( SELECT project_id FROM tasks GROUP BY `project_id` WHERE status = 'true'
      HAVING COUNT(`id`) > 10) `t` ON `t`.`project_id` = `p`.`id` ORDER BY `p`.`id` ASC")
=end
=begin
  Get the count of all tasks in each project, order by tasks count descending.
  SELECT p.name as project_name, count(t.id) as count_tasks FROM projects p LEFT JOIN tasks t ON  t.project_id = p.id  GROUP BY project_name ORDER BY count_tasks DESC
  Get the count of all tasks in each project, order by project names.
  SELECT p.name as project_name, count(t.id) as count_tasks FROM projects p LEFT JOIN tasks t ON  t.project_id = p.id  GROUP BY project_name ORDER BY project_name
  Get the tasks for all projects having the name beginning with “N” letter.
  SELECT t.name as task_name, p.name as project_name FROM tasks t, projects p WHERE p.name LIKE "N%" AND t.project_id = p.id
  Get the list of all projects containing the “a” letter in the middle of the name, and show the tasks count near each project. Mention that there can exist projects without tasks and tasks with project_id=NULL.
  SELECT p.name as project_name, count(t.id) as count_tasks FROM projects p LEFT JOIN tasks t on t.project_
  get the list of tasks with duplicate names. Order alphabetically

SELECT * 
FROM `tasks`  
INNER JOIN(
    SELECT `name`  
    FROM `tasks`  
    GROUP BY `name`  
    HAVING COUNT(`name`) > 1  
) `temp` ON `tasks`.`name` = `temp`.`name`
ORDER BY `tasks`.`name` ASC

get the list of tasks having several exact matches of both name and status, from the project 'Garage'. Order by matches count
SELECT `t`.`name`, `t`.`status`, COUNT(`t`.`name`) `c`
FROM `tasks` `t`
INNER JOIN `projects` `p` ON `t`.`project_id` = `p`.`id`
INNER JOIN (
  SELECT CONCAT(`name`, `status`) `ns`
    FROM `tasks`
    GROUP BY `ns`
    HAVING COUNT(`ns`) > 1
) `temp` ON CONCAT(`t`.`name`, `t`.status) = `temp`.`ns`
WHERE `p`.`name` = 'Garage'
GROUP BY `t`.`name`, `t`.`status`
ORDER BY `c` ASC

get the list of project names having more than 10 tasks in status 'completed'. Order by project_id
SELECT `p`.`name`
FROM `projects` `p`
INNER JOIN (
  SELECT `project_id`
    FROM `tasks`
    GROUP BY `project_id`
    WHERE `status` = 'completed'
    HAVING COUNT(`id`) > 10
) `t` ON `t`.`project_id` = `p`.`id`
ORDER BY `p`.`id` ASC
=end

Чекбоксы и дедлайн должны ссылаться на экшн апдейт для тасков
/*  ----------------------------- TASK drag and drop ----------------------------*/ /*
document.addEventListener("turbolinks:load", function(){
  $(".tasks_tbody").sortable({
    update: function(e, ui){
      //console.log($(this).sortable('serialize'))
      $.ajax({
        url: $(this).data("url"),
        type:'PATCH',
        data:$(this).sortable('serialize'),
      });
    },
    handle: ".task_priority_drag_and_drop"    
  });
})
<script>
export default {
  data: function(){
    return {
      message: "hello"
    }
  } 
}
</script>  
  #def edit
  #  @projectID = Project.find(params[:id])
  #end
  user.rb

  # Возвращает ленту projects current_user
  def listprojects
    Project.where("user_id = ?", id)
  end
<!--  
        if @projects.any?
        #project-
        render @list_itemsprojects
        render @projects
    -->
=begin
[1] pry(#<#<Class:0x007ff3c3088d60>>)> @projects
  Project Load (0.1ms)  SELECT "projects".* FROM "projects" WHERE "projects"."user_id" = ?  ORDER BY "projects"."created_at" DESC  [["user_id", 1]]
=> [#<Project:0x007ff3b433a860 id: nil, name: nil, user_id: 1, created_at: nil, updated_at: nil>]
# nil class="project_form" id="project-NIL"


  [1] pry(#<#<Class:0x007ff3b83d6bd0>>)> @feed_itemsprojects
  Project Load (0.2ms)  SELECT "projects".* FROM "projects" WHERE (user_id = 1)  ORDER BY "projects"."created_at" DESC
=> []
[2] pry(#<#<Class:0x007ff3b83d6bd0>>)> 
   (0.3ms)  SELECT COUNT(*) FROM "projects" WHERE "projects"."user_id" = ?  [["user_id", 1]]
  Rendered shared/_listprojects.html.erb (3.4ms)
  Rendered static_pages/home.html.erb within layouts/application (197777.2ms)
Completed 500 Internal Server Error in 197783ms (ActiveRecord: 0.7ms)

ArgumentError ('nil' is not an ActiveModel-compatible object. It must implement :to_partial_path.):
  app/views/shared/_listprojects.html.erb:9:in `_app_views_shared__listprojects_html_erb__3406627487579479017_70342405953720'
  app/views/static_pages/home.html.erb:25:in `_app_views_static_pages_home_html_erb__4543623312712706808_70342348692720'


  Rendered /home/nomid/.rvm/gems/ruby-2.3.3/gems/web-console-2.0.0.beta3/lib/action_dispatch/templates/rescues/_source.erb (7.4ms)
  Rendered /home/nomid/.rvm/gems/ruby-2.3.3/gems/web-console-2.0.0.beta3/lib/action_dispatch/templates/rescues/_trace.html.erb (3.1ms)
  Rendered /home/nomid/.rvm/gems/ruby-2.3.3/gems/web-console-2.0.0.beta3/lib/action_dispatch/templates/rescues/_request_and_response.html.erb (1.0ms)
  Rendered /home/nomid/.rvm/gems/ruby-2.3.3/gems/web-console-2.0.0.beta3/lib/action_dispatch/templates/rescues/_web_console.html.erb (0.8ms)
  Rendered /home/nomid/.rvm/gems/ruby-2.3.3/gems/web-console-2.0.0.beta3/lib/action_dispatch/templates/rescues/diagnostics.html.erb within rescues/layout (27.6ms)




  [1] pry(#<#<Class:0x007ff3c0c16298>>)> @feed_itemsprojects
  Project Load (0.2ms)  SELECT "projects".* FROM "projects" WHERE (user_id = 1)  ORDER BY "projects"."created_at" DESC
  => [#<Project:0x007ff3b5d0ce78
  id: 2,
  name: "QWEqwe123",
  user_id: 1,
  created_at: Thu, 10 Sep 2020 15:03:17 UTC +00:00,
  updated_at: Thu, 10 Sep 2020 15:03:17 UTC +00:00>]

=end
rails db -p

Select id, position from tasks order by position 
2)
def task_deadline_status(task)
    if task.deadline < Time.now 
      return true
    end
    return false
  end


self
тут у тебя task, который ты передаешь, это инстанс(экземпляр) класса Task

ты можешь создавать классовые методы внутри модели Task к примеру:

def self.find_by_id(id)
  Task.find(id)             # self.find(id)        тут будет эквивалентно так как у метода идёт 'def self.'
end

и потом вызывать это метод класса только от класса, например:
Task.find_by_id(55)       # тут вернется инстанс который создастся с атрибутами из базы по id 55
<p> Task.find_by_id(55) </p>



также ты можешь в моделе Task создавать методы инстанса!!!!

def deadline_status
  if self.deadline < Time.now              # тут self ссылается на инстанс (!не класс!)
    'Expired'
  else
    nil
  end
end

и потом вызывать этот метод у инстанса, например:

task = Task.find(1)
task.deadline_status               # тут он вернет или nil или Expired строку

3) поэтому я не вижу смысле в хелпере в который ты и так передаешь инстанс, проще написать метод для инстанса и использовать напрямую в хтмле

<%= task.deadline_status %>
как-то так

c# project.tasks.each do |task| 
    #before_action :find_task,      only: [ :update, :destroy]
  def taskTimeStatus
    #@task_deadline = @task.deadline #undefined method `deadline' 
    if self.deadline < Time.now 
      return true
    end
    return false
  end 

class Task
#26 sumbols format ~"2020-09-04 10:41:06.362186"
#belongs_to :todo_list
  #acts_as_list scope: :todo_list  
#scope -> { order(created_at: :desc) }
# инстанс task
  def deadline_status
    if self.deadline < Time.now              # тут self ссылается на инстанс (!не класс!)
      'Expired'
    else
      nil
    end
  end 
end
module TasksHelper


  # Возвращает task_deadline_status для данного @task
  def task_deadline_status(task)
    task.deadline < Time.now 
  end
=begin  
  def task_deadline_status(task)
    if task.deadline < Time.now 
      return true
    end
    return false
  end
=end
  #helper_method :print_all
  def print_all
    puts "print_all"
  end

  def saytrue
    return true
  end
end

def deadline_status
    if self.deadline < Time.now              # тут self ссылается на инстанс (!не класс!)
      'Expired'
    else
      nil
    end
  end 
             <% @tasks_expired = task.deadline < Time.now%>
             <%= @tasks_expired ? "Expired2" : nil %>
             <%= task.deadline < Time.now ? "Expired3" : nil %>
<!--ProjectsController.print_all
              a = TasksController.new
              a.taskTimeStatus
               @qwert = TasksController.taskTimeStatus 
              @qwert ? "Expired" : nil
             task.taskTimeStatus ? "Expired" : nil
             project.tasks.each do |task|
             task =task.taskTimeStatus
              match ? attribute_missing(match, *args, &block) : super
                task.deadline < Time.now ? "Expired" : nil
                 @taskdeadline.taskdeadline 
                 project.tasks.taskdeadline  
                 @taskdeadline = Task.taskdeadline 
                 super
                 project.tasks.taskdeadline
                 tasks.deadline < Time.now ? "Expired" : nil
                 task.deadline > Time.now ? "In progress" : "Expired"
              
             -->
=begin
  # "2020-12-31 00:57:46" ["created_at", "2020-09-04 10:41:06.362186"], ["updated_at", "2020-09-04 10:41:06.362186"]]
  # deadline: nil, project_id: nil, created_at: nil, updated_at: nil,
  task.created_at Fri, 04 Sep 2020 10:41:06 UTC +00:00
  task.update_attributes(name: "The Dude", project_id: "1")
  
  Tine.now > task.deadline
  
  mm/dd/yy hh:mm:ss
  datetime = /(\d\d)\/(\d\d)\/(\d\d) (\d\d): (\d\d):(\d\d)/
  mo = /(0?[1-9]|1[0-2])/ # От 01 до 09 или от 1 до 9 или 10-12.
  dd = /([0-2]?[1-9]|[1-3][01])/ # 1-9 или 01-09 или 11-19 и т. д.
  yy = /(\d\d)/ # 00-99
  hh = /([01]?[1-9]|[12][0-4])/ # 1-9 или 00-09 или...
  mi = /([0-5]\d)/ # 00-59, обе цифры должны присутствовать.
  ss = /([0-6]\d)?/ # Разрешены еще и доли секунды ;-)
  date = /(#{mo}\/#{dd}\/#{yy})/
  time = /(#{hh}:#{mi}:#{ss})/
  str="Recorded on 11/18/07 20:31:00"
  str.scan(datetime)
  # [["11/18/07 20:31:00", "11/18/07", "11", "18", "00",
  # "20:31:00", "20", "31", ":00"]]

  datetime = %r{(
   (0?[1-9]|1[0-2])/ # mo: от 01 до 09 или от 1 до 9 или 10-12.
   ([0-2]?[1-9]|[1-3][01])/ # dd: 1-9 или 01-09 или 11-19 и т. д.
   (\d\d) [ ] # yy: 00-99
   ([01]?[1-9]|[12][0-4]): # hh: 1-9 или 00-09 или...
   ([0-5]\d): # mm: 00-59, обе цифры должны присутствовать.
   (([0-6]\d))? # ss: разрешены еще и доли секунды ;-)
  )}x
=end
=begin
  def create    
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        @projects = current_user.projects
        @project_count = current_user.projects.count        
        format.js
        @project = Project.new
      else
        format.js        
        #format.json { render json: @project.errors.messages, status: :unprocessable_entity }            
      end
    end      
  end
=end  
=begin
  def create    
    @project = current_user.projects.build(project_params)
    if @project.save
      @projects = current_user.projects
      @project_count = current_user.projects.count
      respond_to do |format|
        if @project.save
          format.html { redirect_to root_url }
          format.js
          @project = Project.new
          #render partial: "projects/project", project: project #@projects
          #render partial: 'shared/feedprojects'#, project: project#, locals:{ task:task}
          #@project = Project.new 
        else
          @feed_itemsprojects = []      
          format.json { render json: @project.errors.messages, status: :unprocessable_entity }    
          #render json: @project.errors.messages, status: :unprocessable_entity #alert(errorResponse.responseJSON.name)
        end
      end  
    end
  end
=end  

/*$(".new_project").html("<%= raw(escape_javascript(render('shared/project_form').html_safe))  %>");
      $(".stats").html("<%= raw(escape_javascript(render('shared/stats').html_safe))  %>");
      $(".projectsN").html("<%= raw(escape_javascript(render('shared/feedprojects').html_safe)) %>");  */




_project_form.erb
<form class="project_create_form" id="project-<%= project.id %>">
    <span>      
      <div><input class="input-sm" id="" placeholder="+ add Project"></input></div>
      <div class="new_task btn btn-success btn-sm" data-id="<%=project.id%>">Add Task</div>      
    </span>
  </form> 

_project_form.erb
<%= form_for(@project, remote: true) do |f| %>  
  <%= render 'shared/error_messages', object: f.object %>
  <div class="field">
    <%= f.text_area :name, placeholder: "+ add Project", class: "form-control" %>
  </div>
  <%= f.submit({:class =>'btn btn-success',value: "add Project"}, "add Project")   %>
<% end %>


=begin
  def create    
    @project = current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        @projects = current_user.projects
        @project_count = current_user.projects.count        
        format.js
        @project = Project.new
      else
        format.js        
        #format.json { render json: @project.errors.messages, status: :unprocessable_entity }            
      end
    end      
  end
=end  
=begin
  def create    
    @project = current_user.projects.build(project_params)
    if @project.save
      @projects = current_user.projects
      @project_count = current_user.projects.count
      respond_to do |format|
        if @project.save
          format.html { redirect_to root_url }
          format.js
          @project = Project.new
        else
          @feed_itemsprojects = []      
          format.json { render json: @project.errors.messages, status: :unprocessable_entity }    
          #render json: @project.errors.messages, status: :unprocessable_entity #alert(errorResponse.responseJSON.name)
        end
      end  
    end
  end
=end
<% if @project.errors.any? %>
  <%= @project.errors.messages   
  %>
  <% else %>
  $(".new_project").html("<%= raw(escape_javascript(render('shared/project_form').html_safe))  %>");
  $(".stats").html("<%= raw(escape_javascript(render('shared/stats').html_safe))  %>");
  $(".projectsN").html("<%= raw(escape_javascript(render('shared/feedprojects').html_safe)) %>");
<% end %>

# дедлайн task_params {task: {name: new_task_name}, task: {status: boolean}, task: {deadline: data}}
<!-- list-groupe. need to have class id. on the tasks list rap each one of task in a div give that div an ids then jquery will no this is a group of items 
and every group of items inside of here and it's gona be sortable   -->

tasks.js
/*document.addEventListener("DOMContentLoaded", () => {
    /*alert("DOM готов!");*/
  /*});
console.log('test1');
$(document).on('load', function(){
  console.log('test222');
  $("#tasksid").sortable();
});
/*document.addEventListener("turbolinks:load", function(){
  alert("turbolinks:load");
  $("#tasksid").sortable();
});*/

/*
document.addEventListener("turbolinks:load", () =>{
  alert("turbolinks:load");
  $("#tasksid").sortable();
});  

$(document).on 'turbolinks:load', -> $("#tasksid").sortable();
$(document)
set uo sortable staf we looking for id task*/
  /*var project_id = $('.new_task').id();
  $("#project_tasks-"+project_id).sortable()*/
  /*$("#project_tasks-"+this.dataset.id).sortable()*/
  /*var dataset_id =this.dataset.id*/
  #
projects/edit.html.erb
<% provide(:title, "Edit project") %>
<h1>Editing </h1>
<%= render 'projects/form'%>
<%= link_to 'Edit', edit_project_path(@project) %>

projects/show.html.erb
<% provide(:title, @project.name) %>

  <strong>Project name:</strong>  <%= @project.name %>

  <p>
    <strong>User:</strong>
    <%= @project.user_id %>
    <strong>Project id:</strong>
    <%= @project.id %>
  </p>
  <h1>        
    <strong>Task name:</strong><%= @task.name %>
  </h1>
  <p>
    <strong>Project name:</strong>
      <%= @project.name %>  
  </p>
  
<%= link_to 'Edit', edit_project_path(@project) %> |
<%= link_to 'New User', new_user_path %> |
<%= link_to 'Back to users Listing', users_path %>

tasks/show.html.erb
<% provide(:title, @task.name) %>
  <h1>        
    <strong>Task name:</strong><%= @task.name %>
  </h1>

    <%= render partial: 'shared/task_form'%>
  
  <p>
    <strong>Project id:</strong>
      <%= @project.id %>
        <strong>Project name:</strong>
      <%= @project.name %>  
    <strong>Task id:</strong>
      <%= @task.id %>
    <strong>Tasks:</strong>    
      <%= @tasks = Task.all %>  
  </p>
  <strong>11111111111111Tasks:</strong>    
  <%= $NOT_CONST %> 


 # @project должна предналежать Active Record::Relation
#resources :tasks,            only: [:index, :create, :edit, :update, :show, :destroy] 
#resources :projects,            only: [:index, :create, :edit, :update, :show, :destroy]
  # ресурс внутри ресурса
  def project_params   
    params.require(:project).permit(:name)
  end
 #binding.pry #ошибки в котроллере
  #разрешение на редактирование
                   #json ключ текст 
home
def sort
    params[:task].each_with_index do |id, index| 
    Task.where(id: id).update_all(position: index + 1)
    end    
    head :ok
  end  
#/*task[]=51&task[]=50&task[]=58*/
  #binding.pry #PATCH "/tasks/sort" #/* {"task"=>["58", "50", "51"], "controller"=>"tasks", "action"=>"sort"} */      
  #id from each one item in the index
  #@tasks = Task.order(:position)
<div>
      <div class="field"> 
        <h3> Simple todo list </h3>
        <h3> From ruby garage </h3>
        <h3>Projects (<%= @user.projects.count %>)</h3>
        <button type="button" id="formButton">+ add_TODO_List</button>
        <%= render 'shared/project_form' %>
        <div class="feld123">
        <%= form_for(@project) do |f| %>
        <%= render 'shared/error_messages', object: f.object %>
          <div class="field">
          <%= f.text_area :project_name, placeholder: "+ add Project" %>
          </div>
          <%= f.submit "+ add TODO List", class: "btn btn-primary" %>
        <% end %>
        <%= form_tag method: :post do %>
        <%= submit_tag 'Call Action' %>
        <% end %>
        <%= render 'shared/feedprojects' %>
      </div>
    </div>  
на чекбокс походу нужен отдельный ивент что бы при клике сразу отправлять true или false и апдейтить таску


Fetching jquery-ui-rails 5.0.5
Installing jquery-ui-rails 5.0.5
Fetching acts_as_list 0.9.19
Installing acts_as_list 0.9.19

rails g migration AddPositionToTodoItem position:integer
rails g migration AddPositionToTasks position:integer

  invoke  active_record
  create    db/migrate/20200825113732_add_position_to_tasks.rb
== 20200825113732 AddPositionToTasks: migrating ===============================
-- add_column(:tasks, :position, :integer)
   -> 0.0005s
== 20200825113732 AddPositionToTasks: migrated (0.0006s) ======================
create a new js file
tasks.js




SQL (4.6ms)  UPDATE "tasks" SET "position" = 1 WHERE "tasks"."id" = ?  [["id", 58]]
  SQL (3.6ms)  UPDATE "tasks" SET "position" = 2 WHERE "tasks"."id" = ?  [["id", 50]]
  SQL (3.8ms)  UPDATE "tasks" SET "position" = 3 WHERE "tasks"."id" = ?  [["id", 51]]
Completed 200 OK in 412077ms (ActiveRecord: 11.9ms)
Started PATCH "/tasks/sort" for 127.0.0.1 at 2020-08-25 21:30:25 +0300
Processing by TasksController#sort as */*
  Parameters: {"task"=>["8", "2", "5"]}
  SQL (3.6ms)  UPDATE "tasks" SET "position" = 1 WHERE "tasks"."id" IN (SELECT "tasks"."id" FROM "tasks" WHERE "tasks"."id" = ?  ORDER BY "tasks"."position" ASC)  [["id", 8]]
  SQL (3.6ms)  UPDATE "tasks" SET "position" = 2 WHERE "tasks"."id" IN (SELECT "tasks"."id" FROM "tasks" WHERE "tasks"."id" = ?  ORDER BY "tasks"."position" ASC)  [["id", 2]]
  SQL (3.3ms)  UPDATE "tasks" SET "position" = 3 WHERE "tasks"."id" IN (SELECT "tasks"."id" FROM "tasks" WHERE "tasks"."id" = ?  ORDER BY "tasks"."position" ASC)  [["id", 5]]
Completed 200 OK in 14ms (ActiveRecord: 10.5ms)

=begin
    #render json: @task
    respond_to do |format|
      format.json {render partial: "tasks/task"}#render task #"tasks/task"
      end
    respond_to do |format|
      format.json {render partial: 'shared/taskslist', project: project}#Missing partial shared/_taskslist with
      end

    #render json: 'shared/taskslist', project_id: @task.project_id
      #render 'shared/taskslist', project: project

    #task.all.name.reorder('status')
    #task = Task.where(project_id: '1').count

    render json: 'shared/taskslist', project_id: task.project_id                  
=end

#render json: 'tasks/task'     # только одну таску
      #flash[:success] = "task created!"
      #respond_to do |format|
      #format.html { redirect_to root_url }
      #@task = Task.new
#Task.create    
    # берем из объекта хеша :project_id
                                                # хеше ключ :project_id :task ищет ассоциативный масив json ключ текст 
    #undefined local variable or method `project'                                                
    #task = project.tasks.create(task_params)
    #@project = Project.find(params[:id])    
    #@task = Task.build(task_params)
    #@task = Task.create(task_params)
    #/*{"task"=>{"name"=>"dsadsadsa"}, "controller"=>"tasks", "action"=>"create", "project_id"=>"3"}*/
    #binding.pry
    #@project = current_user.projects.find(params[:id])
<div id="tasks2" class="list-groupe">
      <% @tasks.each do |task| %>
       <%= link_to task.name, class:"list-groupe-item" %>
      <%end%>
  </div>

<table class="tasks_list" id="project_tasks_list-<%=project.id%>" data-id="<%=project.id%>">  

<div class="task table table-condensed" id="task_id_<%=task.id%>" data-project-id="<%=task.project_id%>">
  <input type="checkbox" id="task_id_<%=task.id%>" data-id="<%=task.id%>" data-project-id="<%=task.project_id%> name="option1" value="a1">
  <div class="form_task_name" id="form_task_name_<%=task.id%>">
         
    <div class="task_name" id="task_name_<%=task.id%>"><%= task.name %></div>            
  </div>

  <div class="form_delete_task" id="form_delete_task_<%=task.id%>">
    <div class="delete_task btn btn-default btn-xs" id="delete_task_button_<%=task.id%>" data-id="<%=task.id%>" data-projectid="<%=task.project_id%>">DELETE</div>
    <div class="edit_task btn btn-default btn-xs" data-id="<%=task.id%>" data-projectid="<%=task.project_id%>">EDIT</div>
  </div>

  <div class="task_input" id="task_input_<%=task.id%>">
    <input class="task_edit" id="task_edit_<%=task.id%>" value="<%= task.name %>"></input>
    <div class="update_task btn btn-success btn-xs" data-id="<%=task.id%>" data-projectid="<%=task.project_id%>">UPDATE</div>               
  </div>
</div>

render json: .... Для АПИ и обьектов
/*
<!--
    <div class="tasks" id="project_tasks_list-<%= project.id %>">      
    <% project.tasks.each #do |task| %>
      <%= #render task %>
    <% #end %>
    </div>
    -->
/*_task*/
<ul class="task_list" id="task-<%= task.id %>">
  <span class="form_delete_task" id="form_delete_task_<%=task.id%>">
    <div class="delete_task" id="delete_task_button_<%=task.id%>" data-id="<%=task.id%>">DELETE</div>
  </span>
  <span class="task_input" id="task_input_<%=task.id%>">
    <input class="task_edit" id="task_edit_<%=task.id%>" value="<%= task.name %>"></input>
    <div class="update_task" data-id="<%=task.id%>">UPDATE</div>               
  </span>
  <span class="form_task_name" id="form_task_name_<%=task.id%>">
    <div class="task_name" id="task_name_<%=task.id%>"><%= task.name %></div>        
    <div class="edit_task" data-id="<%=task.id%>">EDIT</div>
  </span>
</ul>

params.require(:action)

params.require(:project)
<input class="new_task_field" id="project_task_<%=project.id%>" name="_method" name="task[name]" value="Start typing here to create a task..."></input>

 <%= form_for("nil") do |f| %>
        <div class="field">
          <%= f.text_area :name, placeholder: "Start typing here to create a task..." %>
        </div>
        <%= f.submit "Add Task", class: "btn btn-success" %>
      <% end %>

 <% @task = Task.new %>
      <%= render 'shared/task_form', project: project %><!--передать project: project в паршел -->
<%= form_for @task, url: project_tasks_path(project) do |f| %>

  <div class="field">
    <%= f.text_area :name, placeholder: "Start typing here to create a task..." %>
  </div>
  <%= f.submit "Add Task", class: "btn btn-success" %>
<% end %>


<%= render 'shared/task_form', project: project %><!--передать project: project в паршел -->

<% task = Task.new %>
<%= form_for task, as: :task, url: PATH_FROM_ROUTES(project, task), } do |f| %>
  ...
<% end %>


project_tasks_path(project)


Started POST "/tasks" for 127.0.0.1 at 2020-08-19 16:27:04 +0300
Processing by TasksController#create as HTML
  Parameters: {"utf8"=>"✓", "authenticity_token"=>"eDWoS/seq6W3eBwO3Fl3gLrCzXitOvzFHTrlU36AMKCS/+0xVZY6FK8lwwKGEfNxeN2T20oE0978KbliyIT+Uw==", "task"=>{"name"=>"asdasdasd"}, "commit"=>"Add Task"}

From: /home/nomid/workspace/simple_todo_lists/app/controllers/tasks_controller.rb:21 TasksController#create:

    16: def create #Task.create    
    17:   #@project = Project.find(params[:id])
    18:   #@task = Task.build(task_params)
    19:   #@task = Task.create(task_params)
    20: 
 => 21:   binding.pry
    22:   @project = current_user.projects.find(params[:id])
    23:   @task = project.tasks.create(task_params)
    24:   #binding.pry
    25:   if @task.save
    26:     flash[:success] = "task created!"
    27:     redirect_to request.referrer || root_url
    28:     @task = Task.new      
    29:   else
    30:     render 'static_pages/home'
    31:   end
    32: end

[1] pry(#<TasksController>)> params
=> {"utf8"=>"✓",
 "authenticity_token"=>
  "eDWoS/seq6W3eBwO3Fl3gLrCzXitOvzFHTrlU36AMKCS/+0xVZY6FK8lwwKGEfNxeN2T20oE0978KbliyIT+Uw==",
 "task"=>{"name"=>"asdasdasd"},
 "commit"=>"Add Task",
 "controller"=>"tasks",
 "action"=>"create"}


<%= form_for(@task) do |f| %>
        <div class="field">
          <%= f.text_area :name, placeholder: "Start typing here to create a task..." %>
        </div>
        <%= f.submit "Add Task", class: "btn btn-success" %>
      <% end %>

<form class="new_task_task" id="edit_task_1" action="/tasks" accept-charset="UTF-8" method="post">
        <input name="utf8" type="hidden" value="✓">
        <input type="hidden" name="_method" value="post">
        <div class="field">
          <textarea placeholder="Start typing here to create a task..." name="task[name]" id="task_name"></textarea>
        </div>
        <input type="submit" name="commit" value="Add Task" class="btn btn-success" data-id="">
      </form>

<form>
      <input class="new_task_field" id="task_name" name="_method" value="post" name="task[name]" value="Start typing here to create a task..."></input>
      <div class="btn btn-success" data-id="">Add Task</div>
      </form>
<form>
      <input class="new_task_field" id="task_name" name="_method" value="post" name="task[name]" value="Start typing here to create a task..."></input>
      <div class="btn btn-success" data-id="">Add Task</div>
      </form>      


<div class="new_task_form">
  <% task.project.each do |task| %>
    <%= render partial: 'shared/task_form', locals:{ task:task} %>
  <% end %>
  </div>  

<% project.tasks.each do |task| %>
    <%= render task %>

    
  <% end %>    
render partial: 'tasks/task', locals:{ task:task}


<ul>
      <span>
      <div>  
        <strong>Task name:</strong>
        <%= task.name %>
        <strong>Task project_id:</strong>
        <%= task.project_id %>
      </div>
      </span>
    </ul>
=begin  
  #task = Task.new(name:"Text1", status:"true", priority:"1", deadline:"nil", project_id:"1")
  #task.valid?
  #task.save
  # INSERT INTO "tasks" ("name", "status", "priority", "project_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?, ?)
    [["name", "Text1"], ["status", "t"], ["priority", 1], ["project_id", 1],
     ["created_at", "2020-08-18 09:11:49.776496"], ["updated_at", "2020-08-18 09:11:49.776496"]]
  task = Task.first
  Task Load (0.3ms)  SELECT  "tasks".* FROM "tasks"  ORDER BY "tasks"."created_at" DESC LIMIT 1
 => #<Task id: 10, name: "Text1", status: true, priority: 1, deadline: nil, project_id: 1, created_at: "2020-08-18 09:11:49", updated_at: "2020-08-18 09:11:49"> 
2.3.3 :020 > 
  2.3.3 :020 > task.name
 => "Text1" 
2.3.3 :021 > task.id
 => 10 
2.3.3 :022 > task.project_id
 => 1 
2.3.3 :023 > 
2.3.3 :023 > task
 => #<Task id: 10, name: "Text1", status: true, priority: 1, deadline: nil, project_id: 1, created_at: "2020-08-18 09:11:49", updated_at: "2020-08-18 09:11:49"> 
2.3.3 :024 > task.destroy
   (0.2ms)  SAVEPOINT active_record_1
  SQL (0.3ms)  DELETE FROM "tasks" WHERE "tasks"."id" = ?  [["id", 10]]
   (0.1ms)  RELEASE SAVEPOINT active_record_1
 => #<Task id: 10, name: "Text1", status: true, priority: 1, deadline: nil, project_id: 1, created_at: "2020-08-18 09:11:49", updated_at: "2020-08-18 09:11:49"> 
2.3.3 :028 > User.find(10)
  User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 10]]
ActiveRecord::RecordNotFound: Couldn't find User with 'id'=10
2.3.3 :031 > Task.all
  Task Load (0.5ms)  SELECT "tasks".* FROM "tasks"  ORDER BY "tasks"."created_at" DESC
 => #<ActiveRecord::Relation [#<Task id: 9, name: "Fugit in omnis quia commodi voluptatem facilis qua...", status: nil, priority: nil, deadline: nil, project_id: 28, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">,
                              #<Task id: 8, name: "Fugit in omnis quia commodi voluptatem facilis qua...", status: nil, priority: nil, deadline: nil, project_id: 29, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">, #<Task id: 7, name: "Fugit in omnis quia commodi voluptatem facilis qua...", status: nil, priority: nil, deadline: nil, project_id: 30, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">, #<Task id: 6, name: "Voluptatem corporis aliquam voluptas fuga qui.", status: nil, priority: nil, deadline: nil, project_id: 28, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">, #<Task id: 5, name: "Voluptatem corporis aliquam voluptas fuga qui.", status: nil, priority: nil, deadline: nil, project_id: 29, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">, #<Task id: 4, name: "Voluptatem corporis aliquam voluptas fuga qui.", status: nil, priority: nil, deadline: nil, project_id: 30, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">, #<Task id: 3, name: "Quo rerum velit sunt non nostrum quasi omnis.", status: nil, priority: nil, deadline: nil, project_id: 28, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">, #<Task id: 2, name: "Quo rerum velit sunt non nostrum quasi omnis.", status: nil, priority: nil, deadline: nil, project_id: 29, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">, #<Task id: 1, name: "Quo rerum velit sunt non nostrum quasi omnis.", status: nil, priority: nil, deadline: nil, project_id: 30, created_at: "2020-08-17 14:54:19", updated_at: "2020-08-17 14:54:19">]> 
2.3.3 :038 > task = Task.create(id:"11", name:"Text1", project_id:"1")
   (0.2ms)  SAVEPOINT active_record_1
  SQL (0.4ms)  INSERT INTO "tasks" ("id", "name", "project_id", "created_at", "updated_at") VALUES (?, ?, ?, ?, ?)  [["id", 11], ["name", "Text1"], ["project_id", 1], ["created_at", "2020-08-18 09:24:41.243131"], ["updated_at", "2020-08-18 09:24:41.243131"]]
   (0.2ms)  RELEASE SAVEPOINT active_record_1
 => #<Task id: 11, name: "Text1", status: nil, priority: nil, deadline: nil, project_id: 1, created_at: "2020-08-18 09:24:41", updated_at: "2020-08-18 09:24:41"> 


=end

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "123123",
             password_confirmation: "123123")

1.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)

end
users = User.order(:created_at).take(3)
3.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.projects.create!(name: content) }
end
projects = Project.order(:created_at).take(3)
3.times do
  content = Faker::Lorem.sentence(5)
  projects.each { |project| project.tasks.create!(name: content) }
end

<style>
.example
{
display:block;
width: 200px;
}
.example li
{
margin: 4px;
}
</style>
<script>
$(document).ready(function () {
$("body").on("click", ".remove-button", function () {
      $(this).parent().remove();
    });

$("body").on("click", ".create-button", function () {
      var countPlayers = $('.example li').length;
      var player = '<li>Игрок ' + (countPlayers+1)  + 
      ' <a href="javascript: return false;" class="remove-button right">Удалить</a></li>';
      $('.example').append(player);
    });
});
</script>
<ul class="example">
<li>Игрок 1 <a href="javascript: return false;" class="remove-button right">Удалить</a></li>
<li>Игрок 2 <a href="javascript: return false;" class="remove-button right">Удалить</a></li>
<li>Игрок 3 <a href="javascript: return false;" class="remove-button right">Удалить</a></li>
<li>Игрок 4 <a href="javascript: return false;" class="remove-button right">Удалить</a></li>
</ul>
<a href="javascript: return false;" class="create-button">добавить</a>


interpolation in js erb


for selector
Started PATCH "/projects/246" for 127.0.0.1 at 2020-08-14 18:51:01 +0300
Processing by ProjectsController#update as */*
  Parameters: {"project"=>{"name"=>"245edirsss123sqwe"}, "id"=>"246"}
  Project Load (0.2ms)  SELECT  "projects".* FROM "projects" WHERE "projects"."id" = ?  ORDER BY "projects"."created_at" DESC LIMIT 1  [["id", 246]]
  User Load (0.7ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 1]]
  Project Load (0.4ms)  SELECT  "projects".* FROM "projects" WHERE "projects"."user_id" = ? AND "projects"."id" = ?  ORDER BY "projects"."created_at" DESC LIMIT 1  [["user_id", 1], ["id", 246]]

From: /home/nomid/workspace/simple_todo_lists/app/controllers/projects_controller.rb:64 ProjectsController#project_params:

    63: def project_params
 => 64:   binding.pry
    65:   params.require(:project).permit(:name) #разрешение на редактирование
    66: end

[1] pry(#<ProjectsController>)> params
=> {"project"=>{"name"=>"245edirsss123sqwe"},
 "controller"=>"projects",
 "action"=>"update",
 "id"=>"246"}
[2] pry(#<ProjectsController>)> 
   (0.1ms)  begin transaction
  SQL (0.4ms)  UPDATE "projects" SET "name" = ?, "updated_at" = ? WHERE "projects"."id" = ?  [["name", "245edirsss123sqwe"], ["updated_at", "2020-08-14 15:52:03.485963"], ["id", 246]]
   (3.3ms)  commit transaction
Redirected to http://localhost:3000/projects/246/edit
Completed 302 Found in 62157ms (ActiveRecord: 5.3ms)
Started PATCH "/projects/246" for 127.0.0.1 at 2020-08-14 18:52:03 +0300
Processing by ProjectsController#update as */*
  Parameters: {"project"=>{"name"=>"245edirsss123sqwe"}, "id"=>"246"}
  Project Load (0.2ms)  SELECT  "projects".* FROM "projects" WHERE "projects"."id" = ?  ORDER BY "projects"."created_at" DESC LIMIT 1  [["id", 246]]
  User Load (0.1ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 1]]
  Project Load (0.1ms)  SELECT  "projects".* FROM "projects" WHERE "projects"."user_id" = ? AND "projects"."id" = ?  ORDER BY "projects"."created_at" DESC LIMIT 1  [["user_id", 1], ["id", 246]]

From: /home/nomid/workspace/simple_todo_lists/app/controllers/projects_controller.rb:64 ProjectsController#project_params:

    63: def project_params
 => 64:   binding.pry
    65:   params.require(:project).permit(:name) #разрешение на редактирование
    66: end

[1] pry(#<ProjectsController>)> 
   (0.1ms)  begin transaction
   (0.1ms)  commit transaction
Redirected to http://localhost:3000/projects/246/edit
Completed 302 Found in 4855ms (ActiveRecord: 0.6ms)


Started PATCH "/projects/246/edit" for 127.0.0.1 at 2020-08-14 18:52:08 +0300

ActionController::RoutingError (No route matches [PATCH] "/projects/246/edit"):
  web-console (2.0.0.beta3) lib/action_dispatch/debug_exceptions.rb:22:in `middleware_call'
  web-console (2.0.0.beta3) lib/action_dispatch/debug_exceptions.rb:13:in `call'
  actionpack (4.2.2) lib/action_dispatch/middleware/show_exceptions.rb:30:in `call'
  railties (4.2.2) lib/rails/rack/logger.rb:38:in `call_app'
  railties (4.2.2) lib/rails/rack/logger.rb:20:in `block in call'
  activesupport (4.2.2) lib/active_support/tagged_logging.rb:68:in `block in tagged'
  activesupport (4.2.2) lib/active_support/tagged_logging.rb:26:in `tagged'
  activesupport (4.2.2) lib/active_support/tagged_logging.rb:68:in `tagged'
  railties (4.2.2) lib/rails/rack/logger.rb:20:in `call'
  actionpack (4.2.2) lib/action_dispatch/middleware/request_id.rb:21:in `call'
  rack (1.6.13) lib/rack/methodoverride.rb:22:in `call'
  rack (1.6.13) lib/rack/runtime.rb:18:in `call'
  activesupport (4.2.2) lib/active_support/cache/strategy/local_cache_middleware.rb:28:in `call'
  rack (1.6.13) lib/rack/lock.rb:17:in `call'
  actionpack (4.2.2) lib/action_dispatch/middleware/static.rb:113:in `call'
  rack (1.6.13) lib/rack/sendfile.rb:113:in `call'
  railties (4.2.2) lib/rails/engine.rb:518:in `call'
  railties (4.2.2) lib/rails/application.rb:164:in `call'
  rack (1.6.13) lib/rack/lock.rb:17:in `call'
  rack (1.6.13) lib/rack/content_length.rb:15:in `call'
  rack (1.6.13) lib/rack/handler/webrick.rb:88:in `service'
  /home/nomid/.rvm/rubies/ruby-2.3.3/lib/ruby/2.3.0/webrick/httpserver.rb:140:in `service'
  /home/nomid/.rvm/rubies/ruby-2.3.3/lib/ruby/2.3.0/webrick/httpserver.rb:96:in `run'
  /home/nomid/.rvm/rubies/ruby-2.3.3/lib/ruby/2.3.0/webrick/server.rb:296:in `block in start_thread'
Started GET "/" for 127.0.0.1 at 2020-08-14 18:41:00 +0300
Processing by StaticPagesController#home as JS
  User Load (0.2ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 1]]
   (0.2ms)  SELECT COUNT(*) FROM "projects" WHERE "projects"."user_id" = ?  [["user_id", 1]]
  Rendered shared/_user_info.html.erb (0.8ms)
  CACHE (0.0ms)  SELECT COUNT(*) FROM "projects" WHERE "projects"."user_id" = ?  [["user_id", 1]]
  Rendered shared/_stats.html.erb (2.7ms)
  Project Load (0.5ms)  SELECT "projects".* FROM "projects" WHERE "projects"."user_id" = ?  ORDER BY "projects"."created_at" DESC  [["user_id", 1]]
  Rendered projects/_project.html.erb (83.9ms)
  Rendered shared/_feedprojects.html.erb (95.2ms)
  Rendered shared/_error_messages.html.erb (1.4ms)
  Rendered shared/_project_form.erb (9.7ms)
  Rendered static_pages/home.html.erb within layouts/application (135.3ms)
  Rendered layouts/_footer.html.erb (0.3ms)
Completed 200 OK in 214ms (Views: 208.6ms | ActiveRecord: 0.8ms)
*/
*/
Started PATCH "/projects/246" for 127.0.0.1 at 2020-08-14 18:41:07 +0300
Processing by ProjectsController#update as */*
  Parameters: {"name"=>"245eaaaaaa123", "id"=>"246"}
  Project Load (0.5ms)  SELECT  "projects".* FROM "projects" WHERE "projects"."id" = ?  ORDER BY "projects"."created_at" DESC LIMIT 1  [["id", 246]]
  User Load (0.1ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 1]]
  Project Load (0.5ms)  SELECT  "projects".* FROM "projects" WHERE "projects"."user_id" = ? AND "projects"."id" = ?  ORDER BY "projects"."created_at" DESC LIMIT 1  [["user_id", 1], ["id", 246]]
*/
From: /home/nomid/workspace/simple_todo_lists/app/controllers/projects_controller.rb:64 ProjectsController#project_params:
*/
    63: def project_params
 => 64:   binding.pry
    65:   params.require(:project).permit(:name) #разрешение на редактирование
    66: end
*/
[1] pry(#<ProjectsController>)> params
=> {"name"=>"245eaaaaaa123",
 "controller"=>"projects",
 "action"=>"update",
 "id"=>"246"}
[2] pry(#<ProjectsController>)> 
[3] pry(#<ProjectsController>)> params.require(:project)
ActionController::ParameterMissing: param is missing or the value is empty: project
from /home/nomid/.rvm/gems/ruby-2.3.3/gems/actionpack-4.2.2/lib/action_controller/metal/strong_parameters.rb:249:in `require'
[4] pry(#<ProjectsController>)> params.require(:action)
=> "update"
[5] pry(#<ProjectsController>)> [2020-08-14 18:47:32] INFO  going to shutdown ...
*/
