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
        <link rel="stylesheet" href="./css/w3.css">
        <link rel="shortcut icon" type="image/x-icon" href="./img/log-tinad_mob.png" />
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
         <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <style>
            body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
            .w3-navbar,h1,button {font-family: "Montserrat", sans-serif}
            .fa-anchor,.fa-coffee {font-size:200px}

            .w3-red, .w3-hover-red:hover{ background-image:url('./img/tinad-1.jpg'); background-repeat:no-repeat;background-color: #222222!important;}
            .w3-navbar li {
                float: right;
            }
            .map-search-container{
                height: 650px;
                padding: 10px;
                margin: 0;
                margin-right: -8px;
                overflow: hidden;
                overflow-y: scroll;
                background-color: rgba(0,0,0,.075);
            }
        </style>
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
        <div class="container-fluid">
            <div class="row">
                <div class="map-search-container col-md-6">
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
                                <select id="app_search_category" name="app_search[category]" class="form-control ng-pristine ng-valid ng-touched" ng-model="data['app_search[category]']"><option value="">Quel type d'aide ?</option><option value="8">Administratif / Informatique</option><option value="3">Cours particuliers / Coaching</option><option value="6">Bricolage / Jardinage</option><option value="2">Visites de courtoisie</option><option value="4">Dons ou prêts d'objets</option><option value="1">Actions à plusieurs</option><option value="5">Enfants</option><option value="9">Animaux</option><option value="12">Autre</option></select>
                            </div>
                            <div class="form-group col-md-6" style="margin-top: 3px" >
                                <select id="app_search_category" name="app_search[category]" class="form-control ng-pristine ng-valid ng-touched" ng-model="data['app_search[category]']"><option value="">Choisir tag</option><option value="8">Administratif / Informatique</option><option value="3">Cours particuliers / Coaching</option><option value="6">Bricolage / Jardinage</option><option value="2">Visites de courtoisie</option><option value="4">Dons ou prêts d'objets</option><option value="1">Actions à plusieurs</option><option value="5">Enfants</option><option value="9">Animaux</option><option value="12">Autre</option></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6">
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
