<html>
    
<head>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="CSS\login_stylesheet.css">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
	<script type="text/javascript" src="JS\Student\login_validation.js"></script>
</head>

<body>
	<div class="container h-100">
		<div class="d-flex justify-content-center h-100">
			<div class="user_card">
				<div class="d-flex justify-content-center">
					<div class="brand_logo_container">
						<img src="Images\amritalogo_login.png" class="brand_logo" alt="Logo">
					</div>
				</div>
				<div class="d-flex justify-content-center form_container">
					<form action="http://localhost:8080/login_serve" method="POST" onsubmit="return LoginValidation()">
						<div class="input-group mb-3">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-user" style="font-size:15px"></i></span>
							</div>
							<input type="text" id="email" name="email" class="form-control input_user" placeholder="E-mail">
						</div>
						<div class="input-group mb-2">
							<div class="input-group-append">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" id="pass" name="pass" class="form-control input_pass" placeholder="Password">
						</div>
							<div class="d-flex justify-content-center mt-3 login_container">
				 	        <input type="submit" name="button" class="btn login_btn" value="Login"/>
				        </div>
					</form>
				</div>
		
				<div class="mt-4">
					<div class="d-flex justify-content-center links">
						<a href="#">Forgot your password?</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
