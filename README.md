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


Started PATCH "/projects/246" for 127.0.0.1 at 2020-08-14 18:41:07 +0300
Processing by ProjectsController#update as */*
  Parameters: {"name"=>"245eaaaaaa123", "id"=>"246"}
  Project Load (0.5ms)  SELECT  "projects".* FROM "projects" WHERE "projects"."id" = ?  ORDER BY "projects"."created_at" DESC LIMIT 1  [["id", 246]]
  User Load (0.1ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = ? LIMIT 1  [["id", 1]]
  Project Load (0.5ms)  SELECT  "projects".* FROM "projects" WHERE "projects"."user_id" = ? AND "projects"."id" = ?  ORDER BY "projects"."created_at" DESC LIMIT 1  [["user_id", 1], ["id", 246]]

From: /home/nomid/workspace/simple_todo_lists/app/controllers/projects_controller.rb:64 ProjectsController#project_params:

    63: def project_params
 => 64:   binding.pry
    65:   params.require(:project).permit(:name) #разрешение на редактирование
    66: end

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
