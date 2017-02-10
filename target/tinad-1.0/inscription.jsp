
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
        <script src="https://maps.googleapis.com/maps/api/js?&key=AIzaSyCgRfB1v9qicDQyrGds5MOAlM6s3Ylq5Jg&callback=initMap" defer></script>
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
        <header class="w3-container w3-red w3-center w3-padding-128" style="margin-top: -20px;padding-bottom: 1px!important;">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading" style="background-color: #b0ae9b;color: white;">
                        <h3 class="panel-title">S'inscrire</h3>
                    </div>
                    <div class="panel-body" style="background-color: #c4c3b4;">
                        <form role="form" action="Inscription" method="POST">
                            <div class="row">
                                <div class="form-inline">
                                    <input class="form-control" placeholder="nom" name="nom" type="text" style="width: 223px;" autofocus="" required="">
                                    <input class="form-control" placeholder="prenom" name="prenom" type="text" style="width: 223px;" autofocus="">
                                </div><br>
                                <div class="form-inline">
                                    <input class="form-control" placeholder="specialite" name="specialite" type="text" style="width: 223px;" autofocus="" required="">
                                </div><br>
                                <div class="form-inline">
                                    <input class="form-control" placeholder="Adresse email" name="email" type="email" style="width: 223px;" autofocus="" required="">

                                    <select class="form-control" name="genre" style="width: 223px;">
                                        <option value="M">Masculin</option>
                                        <option value="F">Feminin</option>
                                        <option value="A">Autre</option>
                                    </select>
                                </div><br>
                                <div class="form-inline">
                                    <input class="form-control" placeholder="Mot de passe" name="motdepasse" type="password" value="" style="width: 223px;" required="">
                                    <input class="form-control" placeholder="Confirmation " name="confirmation" type="password" style="width: 223px;" value="" required="">
                                </div><br>
                                <div class="form-inline">
                                    <input class="form-control" placeholder="Adresse ou quartier" onchange="codeAddress()" id="address" name="position" type="text" style="width: 223px;" value="">
                                    <input type="button" class="btn btn-default" onclick="codeAddress()" value="localiser">
                                    <input type="hidden" id="lat" name="lat" value="" >
                                    <input type="hidden" id="lng" name="lng" value="">
                                    
                                </div><br>
                                <div style="color: rgb(61, 185, 0);" id="reponse"></div>
                                <div style="margin-left: 31px;" class="g-recaptcha" data-sitekey="6LfbsxIUAAAAANkuC_5deRvVicJpJsl1RlGC_MkD"></div><br><br>
                                <input class="w3-btn w3-large " style="background-color: #8a6d3b;width: 271px;" type="submit" value="Valider">

                            </div>
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
                <a href="#" class="w3-hover-text-light-blue"><i class="fa fa-twitter"></i></a>

            </div>
            <p>Tout droits réserve à <a href="#" target="_blank">Tinad company</a></p>
        </footer>
    </body>
    <script type="text/javascript">
        var geocoder;

        function initMap() {
            geocoder = new google.maps.Geocoder();
        }
        function codeAddress() {
            var addres = document.getElementById("address").value;
            geocoder.geocode({'address': addres}, function (results, status) {
                if (status === google.maps.GeocoderStatus.OK) {
                    document.getElementById('lat').value = results[0].geometry.location.lat();
                    document.getElementById('lng').value = results[0].geometry.location.lng();
                    var div = document.getElementById('reponse');
                    div.textContent = "Adresse valide !!!";
                } else {
                    alert("Le geocodage n\'a pu etre effectue pour la raison suivante: " + status);
                }
            });
        }
    </script>
</html>
