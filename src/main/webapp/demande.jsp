<%-- 
    Document   : offre.jsp
    Created on : 10 janv. 2017, 19:21:41
    Author     : davra
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
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
        <script src="js/angular.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <style>
            header.proposition-show-header .proposition-show-title{
                background-color: rgba(85, 85, 85, 0.64);
            }
            header.proposition-show-header {
                border-bottom: 15px solid crimson;
            }
            .btn-need {
                background-color: #337ab7;
                border: 1px solid #444;
            }
        </style>

    </head>
    <body>
        <nav class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="w3-top">
                <ul class="w3-navbar w3-red w3-card-2 w3-left-align w3-large">
                    <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
                        <a class="w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                    </li>
                    <li style="float:left;"><a href="index.jsp"><img alt="" width="70" height="70" src="./img/log-tinad_mob.png"></a></li>
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

        </nav>
         <div ng-app="myApp" ng-controller="namesCtrl">
            <div ng-repeat="y in names[1].demande  | filter:<% out.print("'"+request.getParameter("objet")+"'"); %>">
        <header class="proposition-show-header">
            <div class="proposition-img-container">
                <img alt="coursaidewelp.jpg" title="coursaidewelp.jpg" src="img/tinad-1.jpg" width="1250" height="833">
            </div>
            <div class="proposition-show-title">

                <h1>"{{y.titre}}"</h1>
                <a href="connexion.jsp" welp-modal="" class="welp-btn btn-need ng-isolate-scope">Aider</a>
            </div>
        </header>
        <div class="w3-row-padding w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-twothird">
                    <h2 class="title-proposition">{{y.prenom}}<small> demande</small></h2>
                    <h5 class="w3-padding-32"><i class="fa fa-tag"></i> Cours particuliers / Coaching</h5>
                    <h6 class="welp-darkblue-color"><i class="fa fa-map-marker"></i>{{y.adresse}}</h6>
                    <p class="w3-text-grey"></p>
                    <a href="profil.jsp?id=" class="btn btn-xs btn-default">
                        <i class="fa fa-user"></i> Voir le profil de {{y.prenom}}
                    </a>
                </div>
                <a class="proposition-avatar" href="/profile/8637/Ferial">



                    <span class="avatar-container">

                        <img alt="shfrg6sbdf67divgadgf6rsduff45s7gzgfdsodk5.jpg" title="shfrg6sbdf67divgadgf6rsduff45s7gzgfdsodk5.jpg" src="img/avatar.png" width="300" height="300" class="img-avatar" style="width: 195px;height: 195px;">
                    </span>
                </a>
            </div>
        </div>

        <div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-third w3-center">
                    <i class="fa fa-mobile-phone w3-padding-64 w3-text-red w3-margin-right"></i>
                </div>

                <div class="w3-twothird">


                    <p class="w3-text-grey"></p><p>Bonjour, <br>
                        <br>
                        {{y.description}}<br>
                        <br>
                        N'hésitez pas à me contacter !</p>
                    <p></p>
                </div>
            </div>
        </div>
            </div>
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
    var module = angular.module('myApp', []);
    var str = <jsp:include page="Publication"></jsp:include>;
    //console.log(str);
    module.controller('namesCtrl', function ($scope, $http) {
        $scope.names = str;
        console.log($scope.names);
    });

</script>
</html>
