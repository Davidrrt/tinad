﻿<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>

        <title>Tinad</title>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="shortcut icon" type="image/x-icon" href="./img/log-tinad_mob.png" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="./css/w3.css">
        <style>
            body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
            .w3-navbar,h1,button {font-family: "Montserrat", sans-serif}
            .fa-anchor,.fa-coffee {font-size:200px}

            .w3-red, .w3-hover-red:hover{ background-image:url('./img/tinad-1.jpg'); background-repeat:no-repeat;background-color: #222222!important;}
            .w3-navbar li {
                float: right;
            }
        </style>
    </head>

    <body>

        <div class="w3-top">
            <ul class="w3-navbar w3-red w3-card-2 w3-left-align w3-large">
                <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
                    <a class="w3-padding-large w3-hover-white w3-large w3-red" href="" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                </li>
                <li style="float:left;"><a href="index.jsp"><img alt="" width="70" height="70" src="./img/log-tinad_mob.png" /></a></li>
                <li><a class="w3-padding-large" href="inscription.jsp" style="color: #bbb9a9;"><i class="fa fa-plus"></i> Inscription</a></li>
                <li><a class="w3-padding-large" href="connexion.jsp" style="color: #bbb9a9;"><i class="fa fa-user"></i> Connexion</a></li>
            </ul>

            <div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium">
                <ul class="w3-navbar w3-left-align w3-large w3-black">
                    <li><a class="w3-padding-large" href="inscription.jsp" style="color: #bbb9a9;"><i class="fa fa-plus"></i> Inscription</a></li>
                    <li><a class="w3-padding-large" href="connexion.jsp" style="color: #bbb9a9;"><i class="fa fa-user"></i> Connexion</a></li>
                </ul>
            </div>
        </div>

        <header class="w3-container w3-red w3-center w3-padding-128">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" style="background-color: #b0ae9b;color: white;">
                        <h3 class="panel-title">Se connecter</h3>
                    </div>
                    <div class="panel-body" style="background-color: #c4c3b4;">
                        <form role="form" method="POST" action="Connexionfront">

                            <div class="form-group">
                                <input class="form-control" placeholder="Adresse email" name="email" type="email" autofocus required>
                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Mot de passe" name="motdepasse" type="password" value="" required="">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input name="remember" type="checkbox" value="Remember Me">Se souvenir de moi
                                </label>
                            </div>
                            <!-- Change this to a button or input when using this as a form -->
                            <button type="submit" class="w3-btn w3-large " style="background-color: #8a6d3b;width: 271px;">Connexion</button>
                            <div class="forgotten-password">
                                <a href="/reset_password/request">J'ai oublié mon mot de passe</a><br>
                            </div>
                            
                        </form>

                    </div>
                    <div class="modal-footer" style="background-color: #b0ae9b;">Pas encore inscrit ? <a href="inscription.jsp">Créer un compte</a></div>

                </div>
            </div>
        </header>



        <div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
            <script type="text/javascript">
                 
            </script>
        </div>

        <footer class="w3-container w3-padding-64 w3-center w3-opacity">
            <div class="w3-xlarge w3-padding-32">
                <a href="#" class="w3-hover-text-indigo"><i class="fa fa-facebook-official"></i></a>
                <a href="#" class="w3-hover-text-red"><i class="fa fa-pinterest-p"></i></a>
                <a href="#" class="w3-hover-text-light-blue"><i class="fa fa-twitter"></i></a>
                <a href="#" class="w3-hover-text-grey"><i class="fa fa-flickr"></i></a>
                <a href="#" class="w3-hover-text-indigo"><i class="fa fa-linkedin"></i></a>
            </div>
            <p>Tout droits réserve à <a href="#" target="_blank">Tinad company</a></p>
        </footer>
    </body>
</html>
