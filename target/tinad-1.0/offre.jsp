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
            <div ng-repeat="x in names[0].wawa  | filter:<% out.print("'"+request.getParameter("objet")+"'"); %>">
            <header class="proposition-show-header" >
            <div class="proposition-img-container">
                <img alt="coursaidewelp.jpg" title="coursaidewelp.jpg" src="img/{{x.img}}" width="1250" height="833">
            </div>
            <div class="proposition-show-title">
                <a class="proposition-avatar" href="">



                    <span class="avatar-container">

                        <img alt="shfrg6sbdf67divgadgf6rsduff45s7gzgfdsodk5.jpg" title="shfrg6sbdf67divgadgf6rsduff45s7gzgfdsodk5.jpg" src="http://serverimg.alwaysdata.net/img/{{x.utilisateur.img}}" width="300" height="300" class="img-avatar" style="width: 195px;height: 195px;">
                    </span>
                </a>
                <h1><i class="fa fa-diamond"></i> {{x.utilisateur.prenom}} <small>propose</small></h1>
                <a href="connexion.jsp" welp-modal="" class="welp-btn btn-need ng-isolate-scope"> Contacter</a>
            </div>
        </header>
        <div class="w3-row-padding w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-twothird">
                    <h2 class="title-proposition">"{{x.titre}}"</h2>
                    <h5 class="w3-padding-32"><i class="fa fa-tag"></i> {{x.categorie}}</h5>
                    <h6 class="welp-darkblue-color"><i class="fa fa-map-marker"></i> {{x.utilisateur.adresse}}</h6>
                    <p class="w3-text-grey"></p>
                    <a href="profil.jsp?membre={{x.idutilisateur}}" class="btn btn-xs btn-default">
                        <i class="fa fa-user"></i> Voir le profil de {{x.utilisateur.prenom}}
                    </a>
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

                <div class="w3-twothird">


                    <p class="w3-text-grey"><p>Bonjour, <br>
                        <br>
                        {{x.description}}
                       </p>
                   
                </div>
            </div>
        </div>
              <input type="hidden" value="{{x.utilisateur.latitude}}">
                        <input type="hidden" value="{{x.utilisateur.longitude}}">
        </div>
        </div>
    <footer class="w3-container w3-padding-64 w3-center w3-opacity">
        <div class="w3-xlarge w3-padding-32">
            <a href="#" class="w3-hover-text-indigo"><i class="fa fa-facebook-official"></i></a>
            <a href="#" class="w3-hover-text-light-blue"><i class="fa fa-twitter"></i></a>
        </div>
        <p>Tout droits r�serve � <a href="#" target="_blank">Tinad company</a></p>
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
        var marker;
        var test="<% out.print(request.getParameter("objet")); %>";
        var late;
        var long;
        for(var i=0;i<str[0].wawa.length;i++){
            if( test.localeCompare(str[0].wawa[i].titre)===0){
                late=str[0].wawa[i].utilisateur.latitude;
                long=str[0].wawa[i].utilisateur.longitude;
            }
        }
       // console.log(late);
        function initMap() {

            var map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: late, lng: long},
                zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            marker = new google.maps.Marker({
                map: map,
                draggable: false,
                animation: google.maps.Animation.DROP,
                position: {lat: late, lng : long},
                   icon: {
                            url: 'img/offre.png',
                            size: new google.maps.Size(80, 64),
                            anchor: new google.maps.Point(28, 64)
                        }
            });
        }

    </script>
</html>
