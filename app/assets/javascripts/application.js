

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
//console.log('---------------Event Loop-------------------------------')
//promise
//setTime(()=>{
//}, 2500)

var task_id = task_status_59.dataset.id;
  var new_task_status5 = document.querySelector("#task_status_"+task_id).checked
    console.log(new_task_status5)
    //false  
  var heading3 = document.querySelector('.status').checked
  console.log(heading3)
  //false
  document.querySelector("#task_status_59").checked
  //true

const delay = (wait=1000) =>{
  const promise = new Promise((resolve, regect)=>{
    setTimeout(()=>{
      //esolve()
      regect('catch regect LOOK ERROR ')
    }, wait)
  })
  return promise
}   
delay(0)
  .then(()=>{
    console.log('after 1s')
  })
  .catch( err=>console.error('error', err))
  .finally(()=>console.log('finally'))

const getData =()=> new Promise(resolve => resolve([1,1,2]))  
getData().then(data=>{console.log(data)})
//не работать с колбэками
async function asyncExample(){
  try{
  await delay(3000)
  const data = await getData()
  console.log('data', data)
  } catch (e){ console.log(e)}
  finally { console.log('f')}
}
/*
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
*/
/*------------------------------- drag and drop view js on a front ------------------------------*/  
//$(document).addEventListener(function(){
  
  /*
  $(".tasks_tbody").sortable({
    update: function(e, ui){
      //console.log($(this).sortable('serialize'))//
      $.ajax({
        url: $(this).data("url"),
        type:'PATCH',
        data:$(this).sortable('serialize'),
      });
    },
    handle: ".task_priority_drag_and_drop"    
  });
  /**/
//});
/*
  var element = document.querySelector(".tasks_tbody")
  if (element != undefined){
    
    const app = new Vue({
      el: element,
      data:{
        tasks: JSON.parse(element.datasset.lists)
      },
      tamplete: "<App :origonal_tasks='tasks'/>",
      components: { App }
    })
    
  }
  */
  /*  ----------------------------- checkbox----------------------------*/  /*
  $(document).on('click', '.status', function() {
    var taskId = this.dataset.id;
    var projectId = this.dataset.projectid;
    var newTaskStatus = $(this).is(":checked")
    var newTaskStatus = document.querySelector("#task_status_"+taskId).checked
    $.ajax({
      url: '/projects/'+projectId+'/tasks/'+taskId,
      type: 'PATCH',
      data: {task: {status: newTaskStatus}},
      success: function(updateData) {
        if (checkboxStatus.status === true){
          console.log('Status done: ' + checkboxStatus.status);
        } else{
          console.log('Status reopen: ' + checkboxStatus.status);
        }
      }        
    });    
  });
  /*  ----------------------------- new_task ---------------------------------------------*/  /*
  $(document).on('click', '.new_task', function() {
    var projectId = this.dataset.id;
    var newTaskName = $("#project_task_"+projectId).val()
    if (newTaskName == "") {        
      $("#project-id-new-task-error-"+projectId).text("Task name must be filled out")
    }else if(newTaskName.length>255){ 
      $("#project-id-new-task-error-"+projectId).text("Task name is too long (maximum is 255 characters)")
    }else {
      $.ajax({
        url: '/projects/' + projectId +'/tasks',
        type: 'POST',
        data: {task: {name: newTaskName}},
        success: function(partialTask) {
          $("#project-id-new-task-error-"+projectId).text("")
          $("#project_task_"+projectId).val('')
          $("#project_tasks-"+projectId).append(partialTask)
        }    
      })
      .fail(function(errorTaskResponse) {
        alert(errorTaskResponse.responseJSON.name)      
      })
    }
  });
  /*  ----------------------------- update_task ---------------------------------------------*/  /*
  $(document).on('click', '.edit_task', function() {
    var taskId =this.dataset.id
    $("#task_name_" + taskId).toggle();
    $("#task_input_" + taskId).toggle();    
  });
  $(document).on('click', '.update_task', function() {
    var taskId = this.dataset.id;
    var projectId = this.dataset.projectid;
    var newTaskName = $("#task_edit_"+taskId).val();
    if (newTaskName == "") {        
      $("#task-edit-control-label-id-"+taskId).text("Task name must be filled out")
    }else if(newTaskName.length>255){ 
      $("#task-edit-control-label-id-"+taskId).text("Task name is too long (maximum is 255 characters)")
    }else {
      $.ajax({
        url: '/projects/'+projectId+'/tasks/'+taskId,
        type: 'PATCH',
        data: {task: {name: newTaskName}},
        success: function(updateTask) {
          $("#task_name_" + updateTask.id).text(updateTask.name);
          $("#task_input_" + updateTask.id).toggle();        
          $("#task_name_" + updateTask.id).toggle();    
        }        
      })
      .fail(function(errorTaskUpdate) {
        alert(errorTaskUpdate.responseJSON.name)
      })
    }  
  });

  /*-------------------------- delete TASK ---------------------------*//*
  $(document).on('click', '.delete_task', function() {    
    var task_id = this.dataset.id;
    var project_id = this.dataset.projectid;    
    $.ajax({
      url: '/projects/'+project_id+'/tasks/'+task_id,
      type: 'DELETE',
      success: function(result) {        
        $("#task_"+ task_id).remove("#task_"+ task_id);
      }      
    });
  });

  /*  ----------------------------- updateTaskDeadline ----------------------------*/  
  /*
  $(document).on('click', '.deadline-task', function() {
    var taskId =this.dataset.id
    $("#task-deadline-edit-id-" + taskId).toggle();
    $("#task-deadline-update-id-" + taskId).toggle();    
  });
  $(document).on('click', '.task-deadline-update', function() {
    var taskId = this.dataset.id;
    var projectId = this.dataset.projectid;
    var updateTaskDeadline = $("#task-deadline-edit-id-"+taskId).val();
    const currentDate = $('.current-date').text()
    if (currentDate >= updateTaskDeadline) {        
      $("#task-deadline-expired-id-"+taskId).text("Set upcoming date").css("color", "red")
    }else{
      $.ajax({
        url: '/projects/'+projectId+'/tasks/'+taskId,
        type: 'PATCH',
        data: {task: {deadline: updateTaskDeadline}},
        success: function(updateTask) {
          if (currentDate < updateTaskDeadline) {
            $("#task-deadline-expired-id-"+taskId).text("In progress").css("color", "green")
          }
        }        
      })
      .fail(function(errorTaskUpdate) {
        alert(errorTaskUpdate.responseJSON.name)
      });
    }
  });
  /*--------------------------------------- create projects -------------------------------------*/
  /*
  $(document).on('click', '.project-create-btn', function() {    
    var newProjectName = $(".project-input-form").val()
    if (newProjectName == "") {        
      $(".project-control-label").text("Project name must be filled out")
    }else if(newProjectName.length>80){ 
      $(".project-control-label").text("Project name is too long (maximum is 80 characters)")
    }else { 
      $.ajax({
        url: '/projects',
        type: 'POST',
        data: {project: {name: newProjectName}},
      success: function(partialProjectsList) {
        $(".project-control-label").text("")
        $('.project-input-form').val('')
        $(".items-projects-list").append(partialProjectsList)
        }
      })
      .fail(function(errorProjectResponse) {
        alert(errorProjectResponse.responseJSON.name)      
      })            
    }      
  });
  /*-------------------------------------- delete_project  -------------------------------------*/
  /*
  $(document).on('click', '.delete_project', function() {
    var id = this.dataset.id
    $.ajax({
      url: '/projects/' + id,
      type: 'DELETE',
      success: function(result) {
        $("#project-"+ id).remove("#project-"+ id);        
      }
    });
  });
  
  /*  ----------------------------- update_project ---------------------------------------------*/
  /*

  $(document).on('click', '.edit_project', function() {
    var projectId =this.dataset.id
    $("#project_input_" + projectId).toggle();
    $("#form_project_name_" + projectId).toggle();    
  });

  $(document).on('click', '.update_project', function() {
    var projectId = this.dataset.id;
    var newProjectName = $("#project_edit_"+projectId).val()
    if (newProjectName == "") {        
      $("#project-update-id-error-" + projectId).text("Project name must be filled out")
    }else if(newProjectName.length>80){ 
      $("#project-update-id-error-" + projectId).text("Project name is too long (maximum is 80 characters)")
    }else { 
      $.ajax({
        url: '/projects/' + projectId,
        type: 'PATCH',
        data: {project: {name: newProjectName}},
        success: function(updateProject) {
          $("#project_input_" + updateProject.id).toggle();
          $("#project_name_" + updateProject.id).text(updateProject.name);
          $("#form_project_name_" + updateProject.id).toggle(); 
        }        
      })
      .fail(function(errorProjectUpdate) { 
        alert(errorProjectUpdate.responseJSON.name)
      })
    }  
  });  

/*create.js.erb
/*$(".stats").html("<%= raw(escape_javascript(render('shared/stats').html_safe))  %>");*/
/*$(".new_project").html("<%= raw(escape_javascript(render('shared/project_form').html_safe))  %>");*/
/*$(".projectsN").html("<%= raw(escape_javascript(render('shared/feedprojects').html_safe)) %>");
*/
/*--------------------------------------- create projects -------------------------------------*/
  /*
  $(document).on('click', '.project-create-btn', function() {    
    var newProjectName = $(".project-input").val()
    
      var x = document.forms["myForm"]["fname"].value;
      if (x == "") {
        alert("Name must be filled out");
      }else {
        $.ajax({
          url: '/projects',
          type: 'POST',
          data: {project: {name: newProjectName}},
        success: function(partialProjectsList) {
          $('.project-input').val('');      
          $(".feed_itemsprojects_list").append(partialProjectsList);
          }
        })
        .fail(function(errorProjectResponse) {
          console.dir(errorProjectResponse.responseJSON.deadline)//delete after f Work deadline
          alert(errorProjectResponse.responseJSON.name)      
        })
      }  
/*  ----------------------------- updateTaskDeadline ----------------------------*/  
  /*
  $(document).on('click', '.edit_task', function() {
    var taskId =this.dataset.id
    $("#task_name_" + taskId).toggle();
    $("#task_input_" + taskId).toggle();    
  });
  */
  /* $(document).ready(function() { need loop on task.count event and check by id------------*/
  /*  
  var currentDate = $('.current-date').text()
  var lastTask = $('.last-task').text()
  for (var i = 0; i < lastTask; i++) {
    var updateTaskDeadline = $("#task-deadline-edit-id-"+i).val()
    if (currentDate > updateTaskDeadline) {
      $("#task-deadline-expired-id-"+i).text("Expired").css("color", "red")
    } else if(currentDate < updateTaskDeadline){
      $("#task-deadline-expired-id-"+i).text("inprogress").css("color", "green")
    } 
  }
  */    
    /*
    $.ajax({
      url: '/projects',
      type: 'POST',
      data: {project: {name: newProjectName}},
    success: function(partialProjectsList) {
      $('.project-input').val('');      
      $(".feed_itemsprojects_list").append(partialProjectsList);
      }
    })
    .fail(function(errorProjectResponse) {
      alert(errorProjectResponse.responseJSON.name)      
    })
    */    
  });
  /*-------------------------------------- delete_project  -------------------------------------*/
  /* -------------------------- TASK create ------------------*/
  /*
  $(document).on('click', '.new_task', function() {    
    var project_id = this.dataset.id;
    var new_task_name = $("#project_task_"+project_id).val()
    $.ajax({
      url: '/projects/' + project_id +'/tasks',
      type: 'POST',
      data: {task: {name: new_task_name}},
      success: function(new_data_name) {        
        $("#project_tasks-"+project_id).append(new_data_name);
        $("#project_task_"+project_id).val('');
        $("#project_task_"+project_id).placeholder.toString = new_data_name.name;
        console.log("new_data_name")
        console.log(new_data_name.name)
        console.dir(new_data_name.name)
      }
      
    });
  }//.catch (new_data_name){ console.log(new_data_name)}
  );
  */
  /* -------------------------- TASK create ------------------*/
    /*
    .fail(function() {
    alert( "error" )
    })
    */
  /*,
      error: function(new_data_name) {
        console.log("new_data_name")        
        console.log(new_data_name)
        console.dir(new_data_name)
        console.log(new_data_name.name)
        console.dir(new_data_name.name)
        alert( new_data_name );  
      }*/
      /*statusCode: {
        422: function(new_data_name) {
      alert( "page not found" );
      console.log("new_data_name")        
        console.log(new_data_name)
        console.dir(new_data_name)
        console.log(new_data_name.name)
        console.dir(new_data_name.name)
        
      }
      } */       
      // & complete  
    /*.fail(function() {
      alert( "error" );
    })
    jqxhr.fail(function() {
      alert( "second complete" )
    })*/
  /*
  $(document).on('click', '.new_task', function() {    
    var project_id = this.dataset.id;
    var new_task_name = $("#project_task_"+project_id).val()

    $.ajax({
      url: '/projects/' + project_id +'/tasks',
      type: 'POST',
      data: {task: {name: new_task_name}},
      success: function(new_data_name) {        
        $("#project_tasks-"+project_id).append(new_data_name);
        $("#project_task_"+project_id).val('');
        $("#project_task_"+project_id).placeholder.toString = new_data_name.name;
        console.log("new_data_name")
        console.log(new_data_name.name)
        console.dir(new_data_name.name)
      }
    })
    .fail(function(){
      alert( "error" )
    })
  }
  );
  */

/*
function addStyle(node){
  node.textContent = 'A'
}

$(document).ready(function() {
  var heading = document.getElementById('hello')
  console.log(heading)
  console.dir(heading)  
  heading.textContent = 'A'
  var heading2 = document.getElementsByTagName('h1')[0]
  console.log(heading2)
  console.dir(heading2)
  var heading3 = document.querySelector('#hello')  
  console.log(heading3)
  console.dir(heading3)
  heading.onclick = () =>{
    if(heading.textContent = 'b'){
    console.log('click h1')
    }
  }
})

//асинхронность Event Loop
//console.log('---------------Event Loop-------------------------------')
//promise
//setTime(()=>{
//}, 2500)
/*
var task_id = task_status_59.dataset.id;
  var new_task_status5 = document.querySelector("#task_status_"+task_id).checked
    console.log(new_task_status5)
    //false  
  var heading3 = document.querySelector('.status').checked
  console.log(heading3)
  //false
  document.querySelector("#task_status_59").checked
  //true

const delay = (wait=1000) =>{
  const promise = new Promise((resolve, regect)=>{
    setTimeout(()=>{
      //esolve()
      regect('catch regect LOOK ERROR ')
    }, wait)
  })
  return promise
}
delay(0)
  .then(()=>{
    console.log('after 1s')
  })
  .catch( err=>console.error('error', err))
  .finally(()=>console.log('finally'))

const getData =()=> new Promise(resolve => resolve([1,1,2]))  
getData().then(data=>{console.log(data)})
//не работать с колбэками
async function asyncExample(){
  try{
  await delay(3000)
  const data = await getData()
  console.log('data', data)
  } catch (e){ console.log(e)}
  finally { console.log('f')}
}


//Context this
console.log('---------------Context this-------------------------------')
const person2 = {
  //сложные названия в виде ключей ''
  'complex key': 'complex value',
  //свойства в скобки [вычислять значения]['Key_'+ (1 + 10)]: 'computed key',
  ['Key_'+ 1 + 10]: 'computed key',
  name: 'dima',
  age: 29,
  languages: ['ru', 'en'],
  //функция someFunction является методом опа в объекте person
  //someFunction: function() {}
  someFunction(){
    console.log('someFunction(){ from person')
  },
  info(){
    console.log('this :', this)
    console.info('info(){console.info(person.name//this :', this.name)//Context this person
  }
}
const logger = {//object===logger совй консоль лог
  keys() {
    console.log('obj:', Object.keys(this))//keys1 is not a function
  }
}
const bound = logger.keys.bind(logger)//bind(this object который указываем)( создает новую функцию привязывает контекст который сами выбираем
bound()//делает функцию
const bound2 = logger.keys(logger)//сразу вызывает
console.log(bound2)//уже пусто
logger.keys.call(logger)//сразу вызывает
console.log('---------------logger.keys.call(person2)-------------------------------')
logger.keys.call(person2)//сразу вызывает
console.log('----------------------------------------------')

console.log('Object.keys(logger):', Object.keys(logger))

const keyV3= {
  keysAndValues() {
  //key: value
  //array          .metod(array key)  
  Object.keys(this).forEach(key =>{ //стрелочныу функции не используют свой собственный контекст
    console.log(`"${key}": ${this[key]}`)
                            //array[key]
  })}
}
keyV3.keysAndValues.call(person2)
const keyV2= {
  keysAndValues() {
  //key: value
  //array          .metod(array key)
  const selfKey = this //сохранить контекст
  Object.keys(this).forEach(function(key) {
    console.log(`"${key}": ${this[key]}`)
                            //array[key]
  }//.bind(this)
  )  
  }
}
keyV2.keysAndValues.call(person2)
const keyV= {
  keysAndValues() {
  //key: value
  //array          .metod(array key)
  const selfKey = this //сохранить контекст
  Object.keys(this).forEach(function(key) {
    console.log(`"${key}": ${selfKey[key]}`)
                            //array[key]
  })  
  }
}
console.log("person2")
console.log("person2Object.keys(this).forEach(key =>{")
keyV.keysAndValues.call(person2)
keyV.keysAndValues.call({a: 1, c: {b:2}})

/*
//person2.info()
const personKeys = Object.keys(person2)//не бежит по прототипу
const logger = {//object===logger совй консоль лог
  keys(obj) {
    console.log('obj:', Object.keys(obj))//keys1 is not a function
  }
}
const logger2 = {//object===logger совй консоль лог keys метод объекта logger2
  keys() {//keys(person2)
    console.log('obj:', Object.keys(this))//keys1 is not a function
                                  //bind(person2)          
  },
  keysAndValues() {
  //key: value
  //array          .metod(array key)
  Object.keys(this).forEach(key =>{
    console.log(`"${key}": ${this[key]}`)
                            //array[key]
  })
}
}
logger.keys(person2)
logger2.keys(person2)
const bound = logger2.keys.bind(logger2)//bind(ключи обекта)( создает новую функцию привязывает контекст который сами выбираем
bound()//привязали контекст логгера2 в boun this===logger2
const bound2 = logger2.keys.bind(person2)//ключи обекта person2
bound2()
logger2.keys.call(person2)//сразу вызывает функцию 

logger2.keysAndValues.call(person2)
logger2.keysAndValues.call(logger2)


const keyV= {
  keysAndValues() {
  //key: value
  //array          .metod(array key)
  Object.keys(this).forEach(key =>{
    console.log(`"${key}": ${this[key]}`)
                            //array[key]
  })  
  }
}
console.log("person2")
console.log("person2Object.keys(this).forEach(key =>{")
keyV.keysAndValues.call(person2)
keyV.keysAndValues.call({a: 1, c: {b:2}})
*/
  


  

  //Есть глобальный объект Objects.методы
  /*
  const person = {
    //сложные названия в виде ключей ''
    'complex key': 'complex value',
    //свойства в скобки [вычислять значения]['Key_'+ (1 + 10)]: 'computed key',
    ['Key_'+ 1 + 10]: 'computed key',
    name: 'dima',
    age: 29,
    languages: ['ru', 'en'],
    //функция someFunction является методом опа в объекте person
    //someFunction: function() {}
    someFunction(){
      console.log('someFunction(){ from person')
    }
  }
  console.log(person)
  //c Object делать циклы нельзя они не итерируемые цикл for in заходит в прототип только по своим свойствам
  for (let key in person){
    if (person.hasOwnProperty(key)){
      console.log('key: '+key)
      console.log('person[key]: '+person[key])    
    }
    //console.log('key: '+key)
    //console.log('person[key]: '+person[key])
  }
  const personKeys = Object.keys(person)//не бежит по прототипу
  console.log(personKeys)
  //array
  personKeys.forEach((key)=>{
    console.log('key: '+key)
    console.log('person[key]: '+person[key])    
  })
  

  
  /*
  delete person.age
  //const name = person.name
  const {name, age: personAge = 10, languages}= person
  console.log(name, personAge, languages)
  //person.Key_110 = undefined
  delete person['Key_110']
  person.languages.push('jp')  
  console.log(person)
  console.log(person['Key_110'])
  const ageKey = 'age'  
  console.log(person[ageKey])
  console.log(person[4])
  console.log(person.name)
  console.log(person['age'])//обращение через стоку к полю//29
  console.log(person['complex key'])
  console.log(person['Key_110'])
  */

  /*

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
  /*
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
  /*
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
  */


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
class="tasks_tbody list-group" data-url="<%= sort_tasks_path %>">
<!-- need to have class id. on the tasks list rap each one of task in a div give that div an ids then jquery will no this is a group of items 
and every group of items inside of here and it's gona be sortable   -->
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
