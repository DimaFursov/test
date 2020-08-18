// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .
$(document).ready(function() {
$("#formButton").click(function() {
    $("#new_project").toggle();
  });
});


/*
$(document).on('click', '.edit_project', function() {
    var dataset_id =this.dataset.id
    $("#project_input_" + dataset_id).toggle();
    $("#project_name_" + dataset_id).toggle();
  });
  $(document).on('click', '.update_project', function() {
  $.ajax({
      url: '/projects/' + dataset_id,
      type: 'PATCH',
      data: {name: input field},
      success: function(update_data) {
        alert("success update application.js"+"#project-"+ dataset_id);
        data = JSON.toString("#project_name_" + dataset_id);               
      }
    });
  });
$(document).ready(function(){
    $("#button").click(function(event){
       var data=$(this).text();
        event.preventDefault()
        $.ajax({
            url: "set_freq.php",
            type: "POST",
            data: {"set_freq":data}, 
            success: function(data){
                data = JSON.toString(data);

            }
        });
    });
});

$("body").on("click", ".remove-button", function () {
      $(this).parent().remove();
    });

$("body").on("click", ".create-button", function () {
      var countPlayers = $('.example li').length;
      var player = '<li>Игрок ' + (countPlayers+1)  + 
      ' <a href="javascript: return false;" class="remove-button right">Удалить</a></li>';
      $('.example').append(player); 
    });

$('.delete_project').click(function() {
    var delete_project = document.getElementByid('delete_project');
    $.ajax({
    url: '/projects/' + delete_project.dataset.id,
    type: 'DELETE',
    success: function(result) {
        console.log(data);
        //$('#delete_project' + projects_id).remove();
        alert("success del projects_id");
        // Do something with the result
    }
});
});

$('#delete_project').click(function() {
    $("href").css("color", "red")    
    var projects = new Object();  
    var projects.href = $("href").val();  
    $.ajax({
    url: projects.href,
    type: 'DELETE',
    success: function(result) {
        alert("success del 91");
        // Do something with the result
    }
});
});

$("p.pWithClass").css("color", "blue").append("<li>New blender</li>"); // colors the text blue
$("li:contains('offic')").css("color", "green");
$("#delete2").click({firstWord: "Project 1", secondWord: "delete"}, function(event){
    alert(event.data.firstWord);
    alert(event.data.secondWord);
});
$('#userButton').click(function() {
    $.get('http://localhost:port/', function(response) {
    alert("success userButton').click(function()");
    });
});

$('#refresh').click(function() {
$.delete("/projects/1")

$(".pWithClass").css("color", "blue"); // colors the text blue

$('').click(function() {
$.get({ url:

$('').click(function() {
$.delete("http://localhost:port/projects") 
$.get('http://localhost:port/projects');
вставлять список проектов
      });


<script>
// после загрузки DOM страницы
$(function() {
  // вставить в элемент #refresh контент файла asidenav.tpl
  // если файл не находится в той же директории что и HTML документ, то необходимо дополнительно указать путь к нему
  $('#refresh').load('asidenav.tpl');
  // загрузить в элемент id="content1" часть файла demo.html (#content1)
  $(this).parent().load('demo.html #content1');
});
</script>
});
$.get("#refresh").onclick("<%= render('shared/feedprojects')%>"); 
$(document).ready(function() {
$("#delete_project").onclick(function() {
$("#delete_project").html("<%= raw(escape_javascript(render('shared/feedprojects').html_safe)) %>");*/