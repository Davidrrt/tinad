<%@page import="com.wbz.tinad.beans.Utilisateur" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  int val =0;
    try {
        Utilisateur perso = (Utilisateur) session.getAttribute("sessionUtilisateur");
        val = perso.getId();
       // out.print(val);

    } catch (Exception e) {
        response.sendRedirect("index.jsp");
    }%>
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
        <style>
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 15% auto; /* 15% from the top and centered */
                padding: 20px;
                border: 1px solid #888;
                width: 33%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button */
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            a.info {
                position: relative;
                color: black;
                text-decoration: none;
                border-bottom: 1px gray dotted; /* On souligne le texte. */
            }
            a.info span {
                display: none; /* On masque l'infobulle. */
            }
            a.info:hover {
                background: none; /* Correction d'un bug d'Internet Explorer. */
                z-index: 500; /* On définit une valeur pour l'ordre d'affichage. */

                cursor: pointer;/* On change le curseur par défaut par un curseur d'aide. */
            }
            a.info:hover span {
                display: inline; /* On affiche l'infobulle. */
                position: absolute;

                white-space: nowrap; /* On change la valeur de la propriété white-space pour qu'il n'y ait pas de retour à la ligne non désiré. */

                top: 30px; /* On positionne notre infobulle. */
                left: 20px;

                background: black;

                color: white;
                padding: 3px;
            }

        </style>

        <script src="js/jquery.min.js"></script>
        <script>
            $(function () {
                $('#my_form').on('submit', function (e) {
                    // On empêche le navigateur de soumettre le formulaire
                    e.preventDefault();

                    var $form = $(this);
                    var formdata = (window.FormData) ? new FormData($form[0]) : null;
                    var data = (formdata !== null) ? formdata : $form.serialize();

                    $.ajax({
                        url: $form.attr('action'),
                        type: $form.attr('method'),
                        contentType: false, // obligatoire pour de l'upload
                        processData: false, // obligatoire pour de l'upload
                        dataType: 'json', // selon le retour attendu
                        data: data,
                        success: function (response) {
                            $('#result > pre').html(JSON.stringify(response, undefined, 4));
                        }
                    });
                });

                // A change sélection de fichier
                $('#my_form').find('input[name="image"]').on('change', function (e) {
                    var files = $(this)[0].files;

                    if (files.length > 0) {
                        // On part du principe qu'il n'y qu'un seul fichier
                        // étant donné que l'on a pas renseigné l'attribut "multiple"
                        var file = files[0],
                                $image_preview = $('#image_preview');

                        // Ici on injecte les informations recoltées sur le fichier pour l'utilisateur
                        $image_preview.find('.thumbnail').removeClass('hidden');
                        $image_preview.find('img').attr('src', window.URL.createObjectURL(file));
                        $image_preview.find('h4').html(file.name);
                        $image_preview.find('.caption p:first').html(file.size + ' bytes');
                    }
                });

                // Bouton "Annuler"
                $('#image_preview').find('button[type="button"]').on('click', function (e) {
                    e.preventDefault();

                    $('#my_form').find('input[name="image"]').val('');
                    $('#image_preview').find('.thumbnail').addClass('hidden');
                });
            });
        </script>
    </head>
    <a href="../../../../../../Desktop/test/bdd.sql"></a>
    <body>
        <div ng-app="myApp" ng-controller="namesCtrl">
            <div ng-controller="infoCtrl">
                <nav class="navbar navbar-default navbar-static-top" role="navigation">
                    <div class="w3-top">
                        <ul class="w3-navbar w3-red w3-card-2 w3-left-align w3-large">
                            <li class="w3-hide-medium w3-hide-large w3-opennav w3-right">
                                <a class="w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                            </li>
                            <li style="float:left;"><a href="index.jsp"><img alt="" width="70" height="70" src="./img/log-tinad_mob.png" /></a></li>
                            <li><a class="w3-padding-large" href="Deconnexion" style="color: #bbb9a9;"><i class="fa fa-power-off"></i> Deconnexion</a></li>
                            <li><a class="w3-padding-large" href="acceuil.jsp" style="color: #bbb9a9;"><i class="fa fa-user"></i> {{info[2].utilisateur[0].prenom}}</a></li>



                        </ul>

                        <div id="navDemo" class="w3-hide w3-hide-large w3-hide-medium">
                            <ul class="w3-navbar w3-left-align w3-large w3-black">
                                <li><a class="w3-padding-large" href="inscription.jsp" style="color: #bbb9a9;"><i class="fa fa-user"></i> {{info[0].offre[0].utilisateur.prenom}}</a></li>
                                <li><a class="w3-padding-large" href="Deconnexion" style="color: #bbb9a9;"><i class="fa fa-power-off"></i> Deconnexion</a></li>
                            </ul>
                        </div>
                    </div>

                </nav>


                <!-- The Modal -->
                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <form  class="form-horizontal" method="POST" action="http://serverimg.alwaysdata.net/traitement.php" enctype="multipart/form-data">

                            <legend>Changer la photo</legend>
                            <div class="form-group">
                                <div class="col-lg-10">
                                    <input type="file" class="form-control" name="file">
                                    <input type="hidden" name="id" value="<% out.print(val); %>">
                                </div>
                            </div>

                            <div class="form-group" style="margin-bottom: 0;">
                                <div id="image_preview" class="col-lg-10 col-lg-offset-2">
                                    <div class="thumbnail hidden">
                                        <img src="http://placehold.it/5" alt="">
                                        <div class="caption">
                                            <h4></h4>
                                            <p></p>
                                            <p><button type="button" class="btn btn-default btn-danger">Annuler</button></p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-2">
                                    <input type="submit" class="btn btn-primary" value="Envoyer">
                                </div>
                            </div>

                        </form>
                    </div>

                </div>

                <div class="container container-fluid" style="margin-top: 65px;margin-bottom: 60px">
                    <div class="row">

                        <div class="user-show-side col-md-4">
                            <a class="link-no-style info" id="myBtn" href="">
                                <img src="http://serverimg.alwaysdata.net/img/{{info[2].utilisateur[0].img}}" width="300" height="300" class="img-avatar" style="width: 200px;height: 200px;">
                                <span >Modifier photo</span>
                            </a>
                            <br>

                            <br>
                            <ul class="user-show-meta">
                                <li class="title">Profil : </li>
                                <li><i class="fa fa-thumbs-o-up welp-darkblue-color"></i> Activité:0</li>
                                <li><i class="fa fa-heart-o need-color"></i> Demande d'aide :{{info[1].demande.length}} </li>
                                <li><i class="fa fa-heart proposition-color"></i> Proposition d'aide : {{info[0].offre.length}}</li>
                                

                            </ul>
                        </div>
                        <div class="user-show-content col-md-8">

                            <h1>{{info[2].utilisateur[0].prenom}} {{info[2].utilisateur[0].nom}} <i class="fa fa-pencil"></i></h1>
                            <h3><i class="fa fa-map-marker"></i>{{info[2].utilisateur[0].adresse}}</h3>
                            <br>
                            <div class="row">
                                <form method="POST" action="statut">
                                <label>Mis à jour de statut :</label>
                                <textarea class="form-control" name="contenu" placeholder="Dites un mot"></textarea>
                                <input type="hidden" name="id" value="{{info[2].utilisateur[0].id}}">
                                <input type="submit" class="btn btn-default" name="bt" value="publier" style="margin-top: 6px;">
                                </form>
                            </div>
                            <br>
                            <label>Statut Actuel :</label>
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
                                                <img src="http://serverimg.alwaysdata.net/img/{{info[0].offre[0].utilisateur.img}}"  alt="Aide et Dépannage Informatique" title="Aide et Dépannage Informatique">
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
        String currPage = "Profil?id="+val;
    %>
    <script type="text/javascript">
        var module = angular.module('myApp', []);
        var str = <jsp:include page="<%=currPage%>"></jsp:include>;
        console.log(str);
        module.controller('namesCtrl', function ($scope, $http) {
            $scope.names = str;
        });
        module.controller('infoCtrl', function ($scope, $http) {
            $scope.info = str;
        });
        function initMap() {

            var map = new google.maps.Map(document.getElementById('map'), {
                center: {lat: str[2].utilisateur[0].latitude, lng: str[2].utilisateur[0].longitude},
                zoom: 14,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });
            marker = new google.maps.Marker({
                map: map,
                draggable: false,
                animation: google.maps.Animation.DROP,
                position: {lat: str[2].utilisateur[0].latitude, lng: str[2].utilisateur[0].longitude},
                icon: {
                    url: 'img/offre.png',
                    size: new google.maps.Size(80, 64),
                    anchor: new google.maps.Point(28, 64)
                }
            });
        }
        var modal = document.getElementById('myModal');
        var btn = document.getElementById("myBtn");
        var span = document.getElementsByClassName("close")[0];
        btn.onclick = function () {
            modal.style.display = "block";
        }
        span.onclick = function () {
            modal.style.display = "none";
        }
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>
</html>
