/**
 * 
 */

 function signup() {

            // getting the values from input
            const user_name = document.getElementById("username").value;
            const email = document.getElementById("email").value;
            const dob = document.getElementById("date_of_birth").value;
            const password = document.getElementById("password").value
            const confirm_password = document.getElementById("confirm_password").value;
            
           
      
            const url = "http://localhost:8080/bitwallet/SignUpServlet?username="+user_name+"&email="+email+"&date_of_birth="+dob+"&password="+password;
			console.log(url);
            axios.post(url)
            .then(function(response){
            	console.log(response);
            	if(response.data==true){
                	 swal("success!", "Susccessfully created account", "success");
                	window.location.href= "http://localhost:8080/bitwallet/login.jsp";
                	  
                 }
                 else{
                	 swal("Failed!", "email already registerd", "error"); 
                 }
            })
            
           
        }

        const form = document.getElementById("form");
        form.addEventListener("submit", e => {
            e.preventDefault();
            signup()
        })