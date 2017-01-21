
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
        <link rel="stylesheet" href="./css/w3.css">
        <link rel="shortcut icon" type="image/x-icon" href="./img/log-tinad_mob.png" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
         <link href="css/style.css" rel="stylesheet" type="text/css">
         <script src="https://www.google.com/recaptcha/api.js" async defer></script>
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
        <header class="w3-container w3-red w3-center w3-padding-128" style="margin-top: -20px;padding-bottom: 81px!important;">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" style="background-color: #b0ae9b;color: white;">
                        <h3 class="panel-title">S'inscrire</h3>
                    </div>
                    <div class="panel-body" style="background-color: #c4c3b4;">
                        <form role="form" action="Inscription" method="POST">
                            <div class="form-inline">
                                <div class="col-md-6">
                                    <label style="margin-left: -172px;">Nom :</label>
                                </div>
                                <div class="col-md-4">
                                    <label style="margin-left: -88px;">Prenom :</label>
                                </div>
                            </div>
                            <div class="form-inline">
                                <div class="col-md-6">
                                    <input class="form-control" placeholder="nom" name="nom" type="text" style="width: 223px;" autofocus="">
                                </div>
                                <div class="col-md-4">
                                    <input class="form-control" placeholder="prenom" name="prenom" type="text" autofocus="">
                                </div>
                            </div>
                            <br><br>
                            <div class="form-inline">
                                <div class="col-md-12">
                                    <label style="margin-left: -360px;">Date de naissance :</label>
                                </div>

                            </div>

                            <div class="form-inline">
                                <div class="col-md-4">
                                    <select class="form-control" name="genre" style="width: 128px;">
                                        <option>Janvier</option>
                                        <option>Fevrier</option>
                                        <option>Mars</option>
                                        <option>Avril</option>
                                        <option>Mai</option>
                                        <option>Juin</option>
                                        <option>Juillet</option>
                                        <option>Aout</option>
                                        <option>Septembre</option>
                                        <option>Octobre</option>
                                        <option>Novembre</option>
                                        <option>Decembre</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <input class="form-control" placeholder="Jour" name="jour" type="number" style="width: 128px;margin-left: -39px;" autofocus="">
                                </div>
                                <div class="col-md-4">
                                    <input class="form-control" placeholder="Année" name="jour" type="number" style="width: 128px;margin-left: -81px;" autofocus="">
                                </div>
                            </div>
                            <br><br>

                            <div class="form-inline">
                                <div class="col-md-6">
                                    <label style="margin-left: -167px;">Email :</label>
                                </div>
                                <div class="col-md-4">
                                    <label style="margin-left: -101px;">Genre :</label>
                                </div>
                            </div>
                            <div class="form-inline">
                                <div class="col-md-6">
                                    <input class="form-control" placeholder="Adresse email" name="email" type="email" style="width: 223px;" autofocus="">
                                </div>
                                <div class="col-md-4">
                                    <select class="form-control" name="genre" style="width: 197px;">
                                        <option>Masculin</option>
                                        <option>Feminin</option>
                                        <option>Autre</option>
                                    </select>
                                </div>
                            </div>
                            <br><br>
                            <div class="form-inline">
                                <div class="col-md-6">
                                    <label style="margin-left: -112px;">Mot de passe :</label>
                                </div>
                                <div class="col-md-4">
                                    <label style="margin-left: -53px;">Confirmation :</label>
                                </div>
                            </div>
                            <div class="form-inline">
                                <div class="col-md-6">
                                    <input class="form-control" placeholder="Mot de passe" name="motdepasse" type="password" value="" style="width: 223px;">
                                </div>
                                <div class="col-md-4">
                                    <input class="form-control" placeholder="Confirmation " name="confirmation" type="password" value="">
                                </div>
                            </div>
                            <br><br>
                            <div class="form-inline">
                                <div class="col-md-6">
                                    <label style="margin-left: -71px;">Adresse ou quartier :</label>
                                </div>

                            </div>
                            <div class="form-group">
                                <input class="form-control" placeholder="Adresse ou quartier" name="position" type="text" style="width: 465px; margin-left: 29px;" value="">
                            </div>
                            <br>
                            <div style="margin-left:10px;" class="g-recaptcha" data-sitekey="6LfbsxIUAAAAANkuC_5deRvVicJpJsl1RlGC_MkD"></div>
                            <!-- Change this to a button or input when using this as a form -->
                            <input class="w3-btn w3-large " style="background-color: #8a6d3b;width: 271px;" type="submit" value="Valider">
                        </form>


                    </div>


                </div>
            </div>
        </header>
        <div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
            <h1 class="w3-margin w3-xlarge"> </h1>
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
