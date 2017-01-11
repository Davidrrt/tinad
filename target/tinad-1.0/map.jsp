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
                                <input type="text" id="app_search_place_name" class="form-control" name="app_search[place][name]" placeholder="Où ?">
                                <input type="hidden" id="app_search_place_latitude" name="app_search[place][latitude]" >
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <select id="app_search_category" name="app_search[category]" class="form-control ng-pristine ng-valid ng-touched" ng-model="data['app_search[category]']"><option value="">Quel type d'aide ?</option><option value="8">Administratif / Informatique</option><option value="3">Cours particuliers / Coaching</option><option value="6">Bricolage / Jardinage</option><option value="4">Dons ou prêts d'objets</option><option value="1">Actions à plusieurs</option><option value="5">Enfants</option><option value="9">Animaux</option><option value="12">Autre</option></select>
                            </div>
                            <div class="form-group col-md-6" style="margin-top: 3px" >
                                <select id="app_search_category" name="app_search[category]" class="form-control ng-pristine ng-valid ng-touched" ng-model="data['app_search[category]']"><option value="">Choisir tag</option><option value="8">Administratif / Informatique</option><option value="3">Cours particuliers / Coaching</option><option value="6">Bricolage / Jardinage</option><option value="2">Visites de courtoisie</option><option value="4">Dons ou prêts d'objets</option><option value="1">Actions à plusieurs</option><option value="5">Enfants</option><option value="9">Animaux</option><option value="12">Autre</option></select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <div class="checkbox "><label for="app_search_organisation"><input type="checkbox" ng-init="data['app_search[organisation]'] = true" ng-model="data['app_search[organisation]']" name="app_search[organisation]" id="app_search_organisation" value="1" checked="checked"><i class="fa fa-empire"></i> Professionnel</label></div>
                            </div>
                            <div class="form-group col-md-6">
                                <div class="checkbox "><label for="app_search_particulier"><input type="checkbox" ng-init="data['app_search[particulier]'] = true" ng-model="data['app_search[particulier]']" name="app_search[particulier]" id="app_search_particulier" value="1" checked="checked"><i class="fa fa-user"></i> Particulier</label></div>
                            </div>
                        </div>
                    </form>
                    <div class="row">
                        <div class="col-md-12">
                            <h3><i class="fa fa-clock-o"></i>Annonces récentes<br> <small class="ng-binding">10 annonces affichées sur 506</small></h3>
                        </div>
                         
                        <div class="col-sm-6 center">
                           <div class="title-announce need-color"><i class="fa fa-heart-o"></i> Demandes</div>
                            <article class="welp-card-need"  ng-repeat="y in names[1].demande">
                                <header>
                                    <a href="">
                                        <img src="https://www.welp.fr/uploads/need/0001/03/thumb_2508_need_home.jpeg" ng-src="https://www.welp.fr/uploads/need/0001/03/thumb_2508_need_home.jpeg" alt="Recherche pour création de site internet" title="Recherche pour création de site internet">
                                    </a> 
                                </header>
                                <h1 class="welp-card-title"><a href="" sf-ng-link="{need_id: need.id, need_slug: need.slug, need_category_slug: need.category.slug}" class="ng-binding"><i class="fa fa-heart-o"></i> {{y.titre}}</a></h1>
                                <h2 class="welp-card-categorie ng-binding"><i class="fa fa-tag"></i> Administratif / Informatique </h2>
                                <span ng-if="!need.author.organisation" class="ng-binding ng-scope"><i class="fa fa-user"></i>{{y.idutilisateur}}</span>
                            </article>
                        </div>
                       
                        <div class="col-sm-6 center " >
                             <div class="title-announce proposition-color"><i class="fa fa-diamond"></i> Offres</div>
                            <article class="welp-card-proposition" ng-repeat="x in names[0].wawa"><header>
                                    <a href="/propositions/1071/administratif-informatique/aide-et-depannage-informatique-1">
                                        <img src="https://www.welp.fr/img/action-detail/avatar.png?1483963234"  alt="Aide et Dépannage Informatique" title="Aide et Dépannage Informatique">
                                    </a>
                                </header><div class="welp-card-content">
                                    <h2 class="welp-card-title"><a href="/propositions/573/administratif-informatique/aide-dans-vos-demarches-administratives-1" sf-ng-link="{proposition_id: proposition.id, proposition_slug: proposition.slug, proposition_category_slug: proposition.category.slug}" class="ng-binding">{{x.idutilisateur}} <small>propose</small></a></h2>
                                    <p class="welp-card-title">"{{x.titre}}"</p>
                                    <h5 class="welp-card-categorie"><i class="fa fa-tag"></i> Administratif / Informatique </h5>
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
                <a href="#" class="w3-hover-text-red"><i class="fa fa-pinterest-p"></i></a>
                <a href="#" class="w3-hover-text-light-blue"><i class="fa fa-twitter"></i></a>
                <a href="#" class="w3-hover-text-grey"><i class="fa fa-flickr"></i></a>
                <a href="#" class="w3-hover-text-indigo"><i class="fa fa-linkedin"></i></a>
            </div>
            <p>Tout droits réserve à <a href="#" target="_blank">Tinad company</a></p>
        </footer>
        <script type="text/javascript">
            var module = angular.module('myApp', []);
            var str = <jsp:include page="Publication"></jsp:include>;
            //console.log(str);
            module.controller('namesCtrl', function ($scope, $http) {
                $scope.names = str;
                console.log($scope.names);
            });

        </script>
        <script>
            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -18.8791902, lng: 47.5079055},
                    zoom: 14,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });
                marker = new google.maps.Marker({
                    map: map,
                    draggable: true,
                    animation: google.maps.Animation.DROP,
                    position: {lat: -18.8791902, lng: 47.5079055}
                });
                marker.addListener('click', toggleBounce);
            }

            function toggleBounce() {
                if (marker.getAnimation() !== null) {
                    marker.setAnimation(null);
                } else {
                    marker.setAnimation(google.maps.Animation.BOUNCE);
                }
            }
        </script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCgRfB1v9qicDQyrGds5MOAlM6s3Ylq5Jg&signed_in=false&callback=initMap"
                async defer>
        </script>
    </body>
</html>
