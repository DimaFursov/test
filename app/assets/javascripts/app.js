//console.log("console.log('app.js')")
/*
function logPerson(s,name,age){
    if (age<0){
      age = 'age <0'
    }
    console.log(s,name,age)
    console.log("logPerson.s "+s)
    console.log("logPerson.s "+s[0])
    console.log("logPerson.s "+s[1])
    console.log("logPerson.s "+s[2])
    console.log("logPerson.s "+s[3])//страку поделило на массив
    console.log(name,age)                     //["Name: ", ", Age: ", "!", raw: Array(3)] "pN1" 1
    return `${s[0]}${name}${s[1]}${age}${s[2]}`
  }
  const pN = 'pN1'
  const pA = 1
  const output = logPerson`Name312: ${pN}, Age123: ${pA}!`//строчку в массив array to s[0]
  console.log(logPerson`Name444: ${pA}, Age444: ${pA}!`)
  */
  /*
  function logPerson(s,name,age){
    if (age<0){
      age = 'age <0'
    }
    console.log(s,name,age)
    console.log("logPerson.s "+s)
    console.log("logPerson.s "+s[0])
    console.log("logPerson.s "+s[1])
    console.log("logPerson.s "+s[2])
    console.log("logPerson.s "+s[3])//страку поделило на массив
    console.log(name,age)                     //["Name: ", ", Age: ", "!", raw: Array(3)] "pN1" 1
    return `${s[0]}${name}${s[1]}${age}${s[2]}`
  }
  /*
  const pN = 'pN1'
  const pA = 1
  const pA2 = -1
  const output = logPerson`Name312: ${pN}, Age123: ${pA}!`//строчку в массив array to s[0]
  console.log(logPerson`Name444: ${pA}, Age444: ${pA}!`)
  const output2 = logPerson`Name: ${pN}, Age: ${pA2}`  
  console.log(output2)
  const output3 = logPerson`Name: ${pN}`
  console.log(logPerson`Name: ${pN}`)
  /*const qwert = 'Qwert'
  console.log(qwert.indexOf('we')) // 1 
  console.log(qwert.indexOf('a')) //-1 нету
  console.log(qwert.startsWith('q')) //false
  console.log("qwert.toLowerCase().startsWith('q')"+qwert.toLowerCase().startsWith('q')) //true
  /*
  //mdm Math
  
  // object
  /*
  const person = new Object('a')
  const person1 = {
    //key value data
    firstName: 'a',
    lastName: 's',
    year: 1,
    mass: ['1'],
    bool: false,
    greet: function(){
      console.log('greet from person1')
    }
  }
  person1.firstName = 0
  console.log(person1)
  console.log(person1.greet)
  person1.greet()
  const key = 0;
  console.log(person[0])
  console.log(person[key])
  person.newKeyName = 'keyValue'
  console.log(person)
  console.log(person[1])
  console.log(person.newKeyName)
  person[1] = 0
  console.log(person[1])
  console.log(person)
  person[0] === 0
  */

  /*0: "Name: "
    1: ", Age: "
    2: "!"
    length: 3

  */
  /*  
  //BigInt
  console.log(typeof 999n)
  console.log(parseInt(999n))
  //Number объект в языке key number: undefined
  console.log(Number.naumber)//undefined  
  console.log('Number.MAX_SAFE_INTEGER ', Number.MAX_SAFE_INTEGER)
  console.log('Math.pow(2, 53)-1 ', Math.pow(2, 53)-1)
  console.log('Number.MIN_SAFE_INTEGER ', Number.MIN_SAFE_INTEGER)
  console.log('Number.MAX_VALUE ', Number.MAX_VALUE)
  console.log('Number.Min_VALUE ', Number.MIN_VALUE)
  console.log('Number.POSITIVE_INFINITY ', Number.POSITIVE_INFINITY)
  console.log('Number.NEGATIVE_INFINITY ', Number.NEGATIVE_INFINITY)
  console.log('1/0 ', 1 / 0)
  console.log('NUMBER.NaN ', Number.NaN)
  console.log('2/undefined ', 2 / undefined)
  const wierd = 2 / undefined
  console.log('isNaN(2/undefined) ', isNaN(wierd))
  //console.log('isFinity(2/undefined) ', Number.isFinity(Infinity))
  //console.log('isFinity(Infinity) ', isFinity(Infinity))
  const parseIntString = '40'
  console.log('parseInt("parseIntString 40") + 2 ', parseInt(parseIntString) + 2)
  console.log('parseInt("parseIntString 40") + 2 ', +parseIntString + 2)
  console.log('parseInt("parseIntString 40") + 2 ', parseFloat(parseIntString) + 2)
  console.log(0.4 + 0.2)
  console.log((0.4 + 0.2).toFixed(1))
  console.log(parseFloat((0.4 + 0.2).toFixed(1)))
  
  
  
  //console.log(person.(1))
  
  var a = 3;
  const b = 1;
  const c = 2;
  const bool =true
  let x
  if (a === 2){
    console.log('a === 2')//тип данных
  }  else if (a != 3){console.log('a != 2')
    } else {console.log('else ' + false || true)}
  //let a =a + b;
  console.log(a+b*c);
  console.log(typeof bool);
  console.log(typeof a);
  console.log(typeof null);
  function calculateNumber(number) {
    return 1 - a
  }
  function calculateNumber2log(string, number2) {
    if (number2 > 0){console.log('stop>0')
      const number1 = calculateNumber(number2)    
      if (number1 > 0){
      console.log('string variable of calculateNumber2 ' + string + ' n ' + number1);
      }
    }
  }
  calculateNumber2log('my string', 1)

  const number1 = calculateNumber(2)
  console.log(number1);
  console.log(calculateNumber(1))
  
  
  //циклы
  
  for (var i = 0; i < cars.length; i++) {
    const car = cars[i]
    console.log(car)
  }
  //for of
  for(let car of cars){
    console.log(car) 
  }
$("#formButton").click(function() {
    $("#new_project").toggle();
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
