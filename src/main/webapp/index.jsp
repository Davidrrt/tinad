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
         <link rel="stylesheet" href="./css/font-awesome.min.css">
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
                <li style="float:left;"><img alt="" width="70" height="70" src="./img/log-tinad_mob.png" /></li>
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
            <img alt="" width="100" height="100" src="./img/log-tinad_mob.png" />
            <h1 class="w3-margin w3-jumbo">TINAD</h1>
            <p class="w3-xlarge">Site d'entraide particuliers&amp;professionel</p>
            <a class="w3-btn w3-padding-16 w3-large w3-margin-top" href="inscription.jsp" style="background-color: crimson;"><i class="fa fa-plus"></i> S'inscrire</a>
            <a class="w3-btn w3-padding-16 w3-large w3-margin-top" href="map.jsp" style="background-color: dimgrey;"><i class="fa fa-map-marker"></i> Voir annonces</a>
        </header>

        <div class="w3-row-padding w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-twothird">
                    <h1> la nouvelle façon de s'entraider</h1>
                    <h5 class="w3-padding-32">Tinad est un réseau d'entraide qui met en relation des personnes qui ont besoin d'aide (particuliers ou autres) avec des personnes prêtes à  les aider et offrir leur service.</h5>

                    <p class="w3-text-grey"></p>
                </div>

                <div class="w3-third w3-center">
                    <i class="fa fa-anchor w3-padding-64 w3-text-red"></i>
                </div>
            </div>
        </div>

        <div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-third w3-center">
                    <i class="fa fa-coffee w3-padding-64 w3-text-red w3-margin-right"></i>
                </div>

                <div class="w3-twothird">
                    <h1>Partout avec vous</h1>
                    <h5 class="w3-padding-32">Disponible sur mobile,tinad a pour but de réunir les utilisateurs en offrant leur compétence contre du service ou inversement.</h5>

                    <p class="w3-text-grey">besoin quotidienne, les personnes presses  par exemple faire un gâteau, rechercher un coiffeur, rechercher un chauffeur, offrir des formations particulier (cours), offrir ces service, â¦ seront satisfait
                        car notre communauté composé de professionnel et particuliers 
                    </p>
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
            <p>Tout droits réserve à  <a href="#" target="_blank">Tinad company</a></p>
        </footer>
    </body>
</html>
