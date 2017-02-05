<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <script src="js/angular.min.js"></script>
        <link rel="stylesheet" href="css/style.css">
        <script src="https://maps.googleapis.com/maps/api/js?&key=AIzaSyCgRfB1v9qicDQyrGds5MOAlM6s3Ylq5Jg&callback=initMap" async defer></script>
    </head>

    <body>

        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="padding-bottom: 1px">
            <div class="w3-top">
                <ul class="w3-navbar w3-red w3-card-2 w3-left-align w3-large">
                    <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
                        <a class="w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
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

        </nav>
        <div class="container-fluid" ng-app="myApp" ng-controller="namesCtrl">
            <div class="row">
                <div class="map-search-container col-md-6" style="margin-top: 11px;">
                    <form name="map-form" id="map-form" class="container-fluid" action="/map/" >
                        <div class="row"><br></div>
                        <div class="row">
                            <h2 class="title"><i class="fa fa-map-marker"></i> Carte des annonces</h2>
                            <div class="form-group col-md-12">
                                <input type="text" id="address" class="form-control" ng-model="tes" placeholder="Où ?">
                            </div>

                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <select class="form-control" ng-model="test1">
                                    <option value="0" selected>Quel type d'aide ?</option>
                                    <option value="1">Informatique</option>
                                </select>
                            </div>

                        </div>
                    </form>
                    <div class="row">
                        <div class="col-md-12" ng-controller="tailleCtrl">
                            <h3><i class="fa fa-clock-o"></i>Annonces récentes<br> <small class="ng-binding">4 annonces affichées sur {{taille}} </small></h3>
                        </div>

                        <div class="col-sm-6 center">
                            <div class="title-announce need-color"><i class="fa fa-heart-o"></i> Demandes</div>
                            <article class="welp-card-need"  ng-repeat="y in names[1].demande| control:test1 | filter:tes | limitTo: 2">
                                <header style="margin-left: 6px;">
                                    <a href="">
                                        <img src="img/{{y.img}}" width="220" height="160">
                                    </a> 
                                </header>
                                <h1 class="welp-card-title"><a href="demande.jsp?objet={{y.titre}}" sf-ng-link="{need_id: need.id, need_slug: need.slug, need_category_slug: need.category.slug}" class="ng-binding"><i class="fa fa-heart-o"></i> {{y.titre}}</a></h1>
                                <h2 class="welp-card-categorie ng-binding"><i class="fa fa-tag"></i> {{y.categorie}}</h2>
                                <span class="ng-binding ng-scope"><i class="fa fa-user"></i>{{y.utilisateur.prenom}}</span>
                                <p><i class="fa fa-map-marker"></i>{{y.utilisateur.adresse}}</p>
                            </article>
                        </div>

                        <div class="col-sm-6 center " >
                            <div class="title-announce proposition-color"><i class="fa fa-diamond"></i> Offres</div>
                            <article class="welp-card-proposition" ng-repeat="x in names[0].wawa| control:test1 | filter:tes | limitTo: 2"><header>
                                    <a href="/propositions/1071/administratif-informatique/aide-et-depannage-informatique-1">
                                        <img src="img/{{x.utilisateur.img}}"  alt="Aide et Dépannage Informatique" title="Aide et Dépannage Informatique">
                                    </a>
                                </header><div class="welp-card-content">
                                    <h2 class="welp-card-title"><a href="offre.jsp?objet={{x.titre}}" class="ng-binding">{{x.utilisateur.prenom}} <small>propose</small></a></h2>
                                    <p class="welp-card-title">"{{x.titre}}"</p>
                                    <h5 class="welp-card-categorie"><i class="fa fa-tag"></i> {{x.categorie}} </h5>
                                    <p><i class="fa fa-map-marker"></i>{{x.utilisateur.adresse}}</p>
                                </div></article>
                        </div>
                    </div>


                </div>
                <div class="col-md-6" style="margin-top: 11px;">
                    <div id="map" style="width:102%;height:650px"></div>
                </div>
            </div>
        </div>



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
        <script type="text/javascript">
            var module = angular.module('myApp', []);
            var str = <jsp:include page="Publication"></jsp:include>;
            //console.log(str[1]);
            module.controller('namesCtrl', function ($scope, $http) {
                $scope.names = str;
                // console.log($scope.names);
            });
            module.controller('tailleCtrl', function ($scope, $http) {
                var val = str[0].wawa.length + str[1].demande.length;
                $scope.taille = val;
                //console.log($scope.taille);
            });
            module.filter('control', function () {
                return function (obj, tab) {
                    console.log(obj[1].categorie);
                    var min = parseInt(tab);
                    //console.log(min);
                    var table = Array();
                    for(var i=0;i<obj.length;i++){
                    if (min > 0) {
                        if (obj[i].idcategorie ==min) {
                            table.push(obj[i]);
                        }
                    }
                    else {
                          table.push(obj[i]);
                    }
                }
                return table;
                };
            });
            function initMap() {

                var map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -18.8791902, lng: 47.5079055},
                    zoom: 14,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });

                for (var i = 0; i < str[0].wawa.length; i++) {
                    new google.maps.Marker({
                        position: new google.maps.LatLng(str[0].wawa[i].utilisateur.latitude, str[0].wawa[i].utilisateur.longitude),
                        map: map,
                        title: "Marqueur wawa",
                        icon: {
                            url: 'img/offre.png',
                            size: new google.maps.Size(80, 64),
                            anchor: new google.maps.Point(28, 64)
                        }
                    });
                }
                for (var i = 0; i < str[1].demande.length; i++) {
                    new google.maps.Marker({
                        position: new google.maps.LatLng(str[1].demande[i].utilisateur.latitude, str[1].demande[i].utilisateur.longitude),
                        map: map,
                        title: "Marqueur demande",
                        icon: {
                            url: 'img/demande.png',
                            size: new google.maps.Size(80, 64),
                            anchor: new google.maps.Point(28, 64)
                        }
                    });
                }
            }
        </script>

    </body>
</html>
