<%  int val = 0;
    if (request.getParameter("membre") != null) {

        try {
            val = Integer.parseInt(request.getParameter("membre"));
        } catch (Exception e) {
            response.sendRedirect("/profil");
        }
    } %>
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
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <script src="js/angular.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?&key=AIzaSyCgRfB1v9qicDQyrGds5MOAlM6s3Ylq5Jg&callback=initMap" async defer></script>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-static-top" role="navigation">
            <div class="w3-top">
                <ul class="w3-navbar w3-red w3-card-2 w3-left-align w3-large">
                    <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
                        <a class="w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                    </li>
                    
                   <% if(session.getAttribute("sessionUtilisateur")!=null){%>
                       <li style="float:left;"><a href="map.jsp"><img alt="" width="70" height="70" src="./img/log-tinad_mob.png"></a></li>
                  <li><a class="w3-padding-large" href="Deconnexion" style="color: #bbb9a9;"><i class="fa fa-power-off"></i> Deconnexion</a></li>
                   <li><a class="w3-padding-large" href="acceuil.jsp" style="color: #bbb9a9;"><i class="fa fa-user"></i> </a></li>

                  <% }else{%>
                   <li style="float:left;"><a href="index.jsp"><img alt="" width="70" height="70" src="./img/log-tinad_mob.png"></a></li>
                <li><a class="w3-padding-large" href="inscription.jsp" style="color: #bbb9a9;"><i class="fa fa-plus"></i> Inscription</a></li>
                <li><a class="w3-padding-large" href="connexion.jsp" style="color: #bbb9a9;"><i class="fa fa-user"></i> Connexion</a></li>
                <%} %>

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

            <div class="container container-fluid" style="margin-top: 65px;margin-bottom: 60px">
                <div class="row">
                    <div ng-controller="infoCtrl">
                        <div class="user-show-side col-md-4">
                            <a class="link-no-style" href="">
                                <span class="avatar-container">
                                    <img src="http://serverimg.alwaysdata.net/img/{{info[2].utilisateur[0].img}}" width="300" height="300" class="img-avatar" style="width: 200px;height: 200px;">
                                </span>
                            </a>
                            <br>

                            <br>
                            <ul class="user-show-meta">
                                <li class="title">Profil : </li>
                                <li><i class="fa fa-thumbs-o-up welp-darkblue-color"></i> Activité: {{info.length}}</li>
                                <li><i class="fa fa-heart-o need-color"></i> Demande d'aide :{{info[1].demande.length}} </li>
                                <li><i class="fa fa-heart proposition-color"></i> Proposition d'aide : {{info[0].offre.length}}</li>

                            </ul>
                        </div>
                        <div class="user-show-content col-md-8" ng-controller="pubCtrl">
                            <div class="row">
                                <img src="http://serverimg.alwaysdata.net/img/{{pub[0].publicite[1].img}}">
                            </div>
                            <h1>Bonjour, je m'appelle {{info[2].utilisateur[0].prenom}}</h1>
                            <h3><i class="fa fa-map-marker"></i>{{info[2].utilisateur[0].adresse}}</h3>
                            <p class="user-description">{{info[2].utilisateur[0].publication}}</p>            
                            <div class="user-show-testimony">
                                <div class="comments-block ">

                                </div>
                            </div>
                            <br><br>
                            <div class="row">
                                <div class="col-md-12">
                                    <h3><i class="fa fa-clock-o"></i>Annonces déjà déposer</h3>
                                </div>

                                <div class="col-sm-6 center">
                                    <div class="title-announce need-color"><i class="fa fa-heart-o"></i> Demandes</div>
                                    <article class="welp-card-need"  ng-repeat="y in names[1].demande">
                                        <header style="margin-left: 6px;">
                                            <a href="demande.jsp?objet={{y.titre}}">
                                                <img src="http://serverimg.alwaysdata.net/img/{{y.img}}" width="220" height="160">
                                            </a> 
                                        </header>
                                        <h1 class="welp-card-title"><a href="demande.jsp?objet={{y.titre}}"><i class="fa fa-heart-o"></i> {{y.titre}}</a></h1>
                                        <h2 class="welp-card-categorie ng-binding"><i class="fa fa-tag"></i>{{y.categorie}} </h2>
                                        <span ng-if="!need.author.organisation" class="ng-binding ng-scope"><i class="fa fa-user"></i>{{y.utilisateur.prenom}}</span>
                                    </article>
                                </div>

                                <div class="col-sm-6 center " >
                                    <div class="title-announce proposition-color"><i class="fa fa-diamond"></i> Offres</div>
                                    <article class="welp-card-proposition" ng-repeat="x in names[0].offre"><header>
                                            <a href="offre.jsp?objet={{x.titre}}">
                                                <img src="http://serverimg.alwaysdata.net/img/{{x.utilisateur.img}}"  alt="Aide et Dépannage Informatique" title="Aide et Dépannage Informatique">
                                            </a>
                                        </header><div class="welp-card-content">
                                            <h2 class="welp-card-title"><a href="offre.jsp?objet={{x.titre}}" >{{x.utilisateur.prenom}} <small>propose</small></a></h2>
                                            <p class="welp-card-title">"{{x.titre}}"</p>
                                            <h5 class="welp-card-categorie"><i class="fa fa-tag"></i> {{x.categorie}}</h5>
                                        </div></article>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-third w3-center">
                    <div class="col-md-6" style="margin-top: 11px ;margin-left: -144px;">
                        <div id="map" style="width: 299%;height: 281px;"></div>
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
    <%
        String currPage = "Profil?id=" + val;
        String currPage1 ="pub";
    %>
    <script type="text/javascript">
        var module = angular.module('myApp', []);
        var str = <jsp:include page="<%=currPage%>"></jsp:include>;
        var str1 =<jsp:include page="<%=currPage1%>"></jsp:include>;
        console.log(str);
        module.controller('namesCtrl', function ($scope, $http) {
            $scope.names = str;
        });
        module.controller('infoCtrl', function ($scope, $http) {
            $scope.info = str;
        });
        module.controller('pubCtrl', function ($scope, $http) {
             $scope.pub = str1;
        });
        function initMap() {

            var map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: str[0].offre[0].utilisateur.latitude, lng: str[0].offre[0].utilisateur.longitude},
                zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            marker = new google.maps.Marker({
                map: map,
                draggable: false,
                animation: google.maps.Animation.DROP,
                position: {lat: str[0].offre[0].utilisateur.latitude, lng: str[0].offre[0].utilisateur.longitude},
                icon: {
                    url: 'img/offre.png',
                    size: new google.maps.Size(80, 64),
                    anchor: new google.maps.Point(28, 64)
                }
            });
        }

    </script>
</html>