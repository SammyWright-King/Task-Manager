<!doctype html>
<html lang="en">
<head>
    <title>Signup - TASK MANAGER</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="{{ asset('validation/css/style.css')}}">

    <style>
        .overlay {
            background: rgba(50, 70, 80, 0.7);
            overflow: auto;
            height: 100%;
            z-index: 2;
        }
    </style>

</head>
    <body class="img js-fullheight" style="background-image: url('validation/images/bg.jpg');">
        <section class="ftcco-section overlay">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6 text-center mb-5">
                        <h2 class="heading-section">Task Manager</h2>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <div class="login-wrap p-0">
                            <h4 class="mb-4 text-center">Don't have an account? Signup</h4>
                            <form action="{{route('post.signup-user')}}" class="signin-form" method="post">
                                @csrf
                                <div class="form-group">
                                    <label>Enter your first name</label>
                                    <input type="text" class="form-control" name="fname" required>
                                </div>
                                <div class="form-group">
                                    <label>Enter your last name</label>
                                    <input type="text" class="form-control" name="lname" required>
                                </div>
                                <div class="form-group">
                                    <label>Address</label>
                                    <input type="text" class="form-control" name="address">
                                </div>
                                <div class="form-group">
                                    <label>Enter E-mail</label>
                                    <input type="email" class="form-control" name="email" required>
                                </div>
                                <div class="form-group">
                                    <label for="password-field">Enter Password</label>
                                    <input id="password-field" type="password" class="form-control" name="password" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <input id="password-field" type="password" class="form-control" name="password_confirmation" required>
                                    <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="form-control btn btn-primary submit px-3">Sign In</button>
                                </div>
                            </form>

                            <p class="w-100 text-center">Already have an account? <a href="{{route('login.user')}}">Login</a></p>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <script src="{{asset('validation/js/jquery.min.js')}}"></script>
        <script src="{{asset('validation/js/popper.js"')}}"></script>
        <script src="{{asset('validation/js/bootstrap.min.js')}}"></script>
        <script src="{{asset('validation/js/main.js')}}"></script>

    </body>
</html>

