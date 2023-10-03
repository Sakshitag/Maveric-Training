// function calculate() {
//     // alert("calculate is called")
//     var val1 = parseInt(document.getElementById('num1').value)
//     var val2 = parseInt(document.getElementById('num2').value)

//     var operation = document.getElementById('operation').value

  
//     if(operation==="add")
//     alert("Addition of two number is " + (val1 + val2))
//     else if(operation==="sub")
//     alert("Subtraction of two number is " + (val1 - val2))
//     else if(operation==="multi")
//     alert("Multiplication of two number is " + (val1 * val2))
//     else if(operation==="div")
//     alert("Division of two number is " + (val1 / val2))


// }


function calculate() {
    // alert("calculate is called")
    var val1 = parseInt(document.getElementById('num1').value)
    var val2 = parseInt(document.getElementById('num2').value)

    var operation = document.getElementById('operation').value

  
    if(operation==="add")
    document.getElementById('result').innerHTML=("Addition of two number is " + (val1 + val2))
    else if(operation==="sub")
    document.getElementById('result').innerHTML=("Subtraction of two number is " + (val1 - val2))
    else if(operation==="multi")
    document.getElementById('result').innerHTML=("Multiplication of two number is " + (val1 * val2))
    else if(operation==="div")
    document.getElementById('result').innerHTML=("Division of two number is " + (val1 / val2))


}