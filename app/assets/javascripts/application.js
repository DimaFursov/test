

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
// `

$(document).ready(function() {
  

  sameFunction('variable value 1')
  //function Expression initialization in variable
  //anonymous
  const sameVariableInitializationFunctionAnonymous = function(variable){
    console.log('sVIFA const f variable: ', variable)
  }
  sameVariableInitializationFunctionAnonymous('variable value')

  const sameVariableInitializationFunctionAnonymous2 = function nameFunction(variable){
    console.log('const sameVariableInitializationFunctionAnonymous2 const f variable: ', variable)
  }
  //sameVariableInitializationFunctionAnonymous2.nameFunction(' text ')//is not a function
  //nameFunction('variable value 2')//error f no defined 
  sameVariableInitializationFunctionAnonymous2('variable value 2.1')

  //function diclaration initialization обращятся кода захотим
  function sameFunction(variable){
    console.log('sameFunction(function sameFunction(variable){ console.log(variable value 1 : ', variable)
  }
  console.log(typeof sameFunction)
  console.dir(sameFunction) //function = object
  //Anonymous. js metod setInterval

  let counter = 0;
  const interval = setInterval(function(){
    if (counter === 10){
      clearInterval(interval)
      console.log('steal HERE!!!')
    }
    console.log(++counter)
    console.log('O_0')
    }, 100)

  //стрелочные функции
  function Function1(variable){
    console.log('V: ', variable)
  }
  const arrow = (variable1, variable2) => { // 1 опустить скобки
    console.log('V2: ', variable2) 
  }
  arrow(1,2)
  const returnPow2 = num => num**2 //опускаются скобки
  console.log(returnPow2(2))
  //Параметры по умолчанию
  const returnPowAplusB = (a='variable', b='default',c=' ') => a+c+b
  console.log(returnPowAplusB())
  //функция с не ограниченным количеством чисел
  /*const sumAll(...all) { //Missing initializer in const declaration
    console.log(all)
  }
  sumAll(1,2,3)*/
  //замыкания private variable name
  function createMember(name){
    return function (lastName){
      console.log(name+lastName)
    }
  }
  const logcreateMamber = createMember('Vladilen')
  console.log(logcreateMamber)
  console.log(logcreateMamber('Dima'))
  console.log(logcreateMamber('Pavel'))
  //array === object
  //const cars =['s', 'a']
  const cars = new Array('zero', 'a')
  console.log(cars[0])
  console.log(cars[5])
  console.log(cars.length)
  cars[0]='new zero'
  console.log(cars[0])
  cars[5]= 5
  console.log(cars)
  /*прототи для структур данных разный функционал 
  более глубокий прототип указывает на object*/
  const arrayCars =['s', 'a']
  console.log("const arrayCars =['s', 'a']")
  console.log("arrayCars"+arrayCars.length)
  function addItemToEnd() {} //отделбная функция
  // metod в контексте объекта 
  arrayCars.push('end') 
  arrayCars.unshift('first')  
  console.log("arrayCars:"+arrayCars)
  const arrayCarsshift = arrayCars.shift()
  const lastVarDELETEarrayCats = arrayCars.pop()  
  console.log("arrayCars:"+arrayCars)
  console.log("arrayCars.reverse()"+arrayCars.reverse())
  const text = "qweasd123qweasdEND"
  const reverseText = text.split('').reverse().join('')//соединить
  console.log("reverseText.text.split('').reverse().join();"+reverseText.split('').reverse().join(''))
  const index_a = cars.indexOf('a')
  const index_b = cars.indexOf('!')//-1
  cars[index_a] = 'new_a'
  cars[index_b] = 'new_a'
  console.log(cars)
  const index_minus = cars.indexOf(-1)//-1
  cars[index_minus] = cars.delete
  console.log(cars)
  const people = [
  {name:'ivan', cost: 1},
  {name:'ivan2', cost:'2'},
  {name:'ivan2', cost:3}
  ]  
  console.dir(people)
  console.log(people)
  const index = people.findIndex(function(namef){
    return namef.cost === 1
  })  
  console.log(people[index])
  const namef = people.find(function(namef){
    return namef.cost === 1
  })
  console.log(namef)
  //цикл
  let a
  for (const person of people){    
    if(person.cost === 1){ 
      a = person
      
    }
  }
  console.log(a)
  const namef1 = people.find( namef1 => namef1.cost === 1)
  console.log(namef1)
  console.log(cars.includes('new_a'))
  console.log(cars)
  const newFilteredCars = cars.filter(calbackNum => {
    return calbackNum != undefined //найс))
  })
  console.log(cars)
  console.log(newFilteredCars)
  const people2 = [
  {name:'ivan', cost: 1},
  {name:'ivan2', cost:2},
  {name:'ivan2', cost:3}
  ]  
  const allCost = people2.reduce((accumulator, person) =>{
    accumulator += person.cost
    return accumulator
  },0)//принемает значения и считает с 0
  console.log('allCost')
  console.log('allCost'+allCost)

  const allCost2 = people2
  .filter(person => person.cost>0)
  .reduce((accumulator, person) => {
    accumulator += person.cost
    return accumulator
  },0)
  console.log('allCostTWO'+allCost2)
  //objects
})
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
/*
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
/*
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

/*
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
/*jquery_ujs
$(document).on('click', "#delete_task_button_"+this.dataset.id, function() {    
    var task_id = this.dataset.id;
    var project_id = $("#project_tasks_list-").dataset.id
    $.ajax({
      url: '/projects/' + project_id +'/tasks/'+task_id,
      type: 'DELETE',
      success: function(result) {
        alert("success delete application.js"+"#task-"+ task_id); 
        $("#task-"+ task_id).remove("#task-"+ task_id);        
      }      
    });
  });  
     var new_task = '<span class="form_task_name">' + '<div>' + new_data_name + '<div>' + '</span>';
        $("#task-"+ dataset_id).append(new_task);

var new_task = '<span class="form_task_name">' + '<div>' + new_task_name + '<div>' + '</span>' *//*не окончен*/
/*
*/    
/*project.name="string" project.save t.string :name  params.require(:project).permit(:name) #разрешение на редактирование*/
/*
$(document).on('click', '.update_project', function() {
    var id = this.dataset.id;
    var update_data=$(".name").text();
    var update_name = $(text_area);
    $.ajax({
      url: '/projects/' + id,
      type: 'PATCH',
      data: {name: input field},
      success: function(update_data) {
        alert("success update application.js"+"#project-"+ id);
        data = JSON.toString(update_name);               
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
*/
