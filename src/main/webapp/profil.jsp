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

    </head>
    <body>
        <nav class="navbar navbar-default navbar-static-top" role="navigation">
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
        <div class="container container-fluid" style="margin-top: 65px;">
            <div class="row">
                <div class="user-show-side col-md-4">
                    <a class="link-no-style" href="/profile/8637/Ferial">
                        <span class="avatar-container">
                            <img alt="shfrg6sbdf67divgadgf6rsduff45s7gzgfdsodk5.jpg" title="shfrg6sbdf67divgadgf6rsduff45s7gzgfdsodk5.jpg" src="https://www.welp.fr/uploads/user/0001/06/thumb_5241_user_big.jpeg" width="300" height="300" class="img-avatar">
                        </span>
                    </a>
                    <br>

                    <br>
                    <ul class="user-show-meta">
                        <li class="title">Profil : </li>
                        <a href="/static/welp/trust"><img src="/img/badge/welperdudimanche.png?1483963234" title="Welper du dimanche" alt="Welper du dimanche"></a>
                        <li data-toggle="tooltip" data-placement="left" title="" data-original-title="Welp ou Contact accepté"><i class="fa fa-thumbs-o-up welp-darkblue-color"></i> Activité: 2</li>
                        <li><i class="fa fa-heart-o need-color"></i> Demande d'aide : 1</li>
                        <li><i class="fa fa-heart proposition-color"></i> Proposition d'aide : 1</li>
                     
                    </ul>
                </div>
                <div class="user-show-content col-md-8">
                    <h1>Bonjour, je m'appelle Ferial!</h1>
                    <h2>75011 Paris</h2>
                    <p class="user-description">Salut nouvelle sur Welp je trouve l'idée top et j'espère contribuer à la communauté en aidant les gens autour de moi. N'hésitez pas à me contacter!</p>            <div class="user-show-testimony">
                        <div class="comments-block ">

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                        <div class="col-md-12">
                            <h3><i class="fa fa-clock-o"></i>Annonces déposer par Ferial</h3>
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
    </div>
</body>
</html>