Панель с заголовком bootstrap

нет смысла инициализировать если ты с ним никак не взаимодействуешь
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