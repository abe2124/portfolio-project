// login functionality
const BASE_URL ='http://127.0.0.1:5000/'
function login(username, password){
    let error = false
    if(username==""){
        $('#error_username').text('please enter valid username or password')
        $('#error_username').show()
        document.getElementById('username').style.border = '1px solid red'
        error = true
    }
     if(password ==""){
        $('#error_username').text('please enter valid username or password')
        $('#error_username').show()
        document.getElementById('password').style.border = '1px solid red'

        error = true
    }
if(error){
return
}

let login_data = JSON.stringify({
    "user_name":username,
    "password":password
})
$.ajax({
    type:"POST",
    url:`${BASE_URL}login`,
    data:login_data,
    success: function(response){
                console.log(response)
       
               // let data = JSON.parse(response)
               localStorage.setItem("BugTracker", JSON.stringify(response))
     
            //    setTimeout(() => {
                if(response['token'] ){
                    window.location.href = "home.html";

                }
            //    }, 2000);
              
    }, 
    error: function(){
        $('#error_username').text('please enter valid username or password')
        $('#error_username').show()
        document.getElementById('username').style.border = '1px solid red'

        $('#error_username').text('please enter valid username or password')
        $('#error_username').show()
        document.getElementById('password').style.border = '1px solid red'
    }
})
    // call the api
}
$('#sign-in').on('click', function(){
    let username = $('#username').val()
    let password = $('#password').val()
    login(username, password)

})
$('#searchbox').on('click', function(){
    localStorage.removeItem('BugTracker')
    window.location.href = "index.html";

})