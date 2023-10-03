
var db;

function createDatabase() {
  db = openDatabase("signupdb", "1.0", "THis is just a signup database", 2 * 1024 * 1024)
  alert("Database is created successfully...")
}

function createTable() {
  db.transaction(function (tx) {
    tx.executeSql("CREATE TABLE IF NOT EXISTS Employee(name,username,email,passsword)")
    alert("Table is created successfully")
  })

}

function saveData() {
  var name = document.getElementById('name').value
  var username = document.getElementById('uname').value
  var email = document.getElementById('email').value
  var passsword = document.getElementById('password').value

  db.transaction(function (tx) {
    console.log("INSERT INTO Employee(name,username,email,passsword) VALUES ('" + name + "','" + username + "','" + email + "','" + passsword+"')")
    tx.executeSql("INSERT INTO Employee(name,username,email,passsword) VALUES ('" + name + "','" + username + "','" + email + "','" + passsword+"')")
    alert("Data is inserted successfully")
  })
}

// Function to handle form submission
function handleFormSubmit(event) {
  console.log("function called..")
  event.preventDefault(); // Prevent form from submitting and page refreshing

  createDatabase()
  createTable()
  saveData()

  // // Get user input values
  // var name = document.getElementById("name").value;
  // var uname = document.getElementById("uname").value;
  // var email = document.getElementById("email").value;
  // var password = document.getElementById("password").value;

  // // Create a new row in the table
  // var table = document.getElementById("user-table");
  // var newRow = table.insertRow();

  // // Insert data into the new row
  // var nameCell = newRow.insertCell(0);
  // nameCell.textContent = name;

  // var unameCell = newRow.insertCell(1);
  // unameCell.textContent = uname;

  // var emailCell = newRow.insertCell(2);
  // emailCell.textContent = email;

  // var passwordCell = newRow.insertCell(3);
  // passwordCell.textContent = password;

 
  
 

  //  // Clear the form inputs
  //  document.getElementById("name").value = "";
  //  document.getElementById("uname").value = "";
  //  document.getElementById("email").value = "";
  //  document.getElementById("password").value = "";
}

// Add event listener to the form
var form = document.getElementById("signup-form");
form.addEventListener("submit", handleFormSubmit);




