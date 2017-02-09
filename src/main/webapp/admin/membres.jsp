<% 
    if(session.getAttribute("admin")==null){
        response.sendRedirect("index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="fr">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Bootstrap Core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../css/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../css/morris.css" rel="stylesheet">

     <link href="../css/font-awesome.min.css" rel="stylesheet">
     <script src="../js/angular.min.js"></script>

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.html">Tinad</a>
                </div>
                <!-- /.navbar-header -->


                <!-- /.navbar-top-links -->

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <img src="../img/log-tinad_mob.png" width="200" height="200">
                        <ul class="nav" id="side-menu">
                            <li class="active">
                                <a href="membres.jsp"><i class="fa fa-users  fa-fw"></i>Gestion membres</a>
                            </li>
                            <li>
                                <a href="pub.jsp"><i class="fa fa-file fa-fw"></i>Gestion publicité</a>
                            </li>
                       
                             <li>
                                  <a href="Deconnexion"><i class="fa fa-power-off fa-fw"></i>Deconnexion</a>
                            </li>

                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Liste des Membres</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row"  ng-app="myApp"  ng-controller="namesCtrl">
                  <div class="col-lg-8 col-lg-offset-2">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Profil</th>
                                            <th>Nom</th>
                                            <th>Prenom</th>
                                            <th>Adresse</th>
                                            <th>Latitude</th>
                                            <th>Longitude</th>
                                            <th>Specialité</th>
                                            <th>modification</th>
                                            <th>suppression</th>
                                        </tr>
                                    </thead>
                                    <tr ng-repeat="x in names[0].membre">
                                        <td ><img src="http://serverimg.alwaysdata.net/img/{{x.img}}"  width="300" height="300"  style="width: 100px;height: 118px;"></td>
                                        <td>{{x.nom}}</td>
                                        <td>{{x.prenom}}</td>
                                        <td>{{x.adresse}}</td>
                                        <td>{{x.latitude}}</td>
                                        <td>{{x.longitude}}</td>
                                        <td>{{x.specialite}}</td>

                                        <td><button value="{{x.id}}" class="btn btn-primary" name="modifier">Modifier</button></td>
                                        <td><button value="{{x.id}}" name="supprimer" class="btn btn-danger">supprimer</button></td>
                                    </tr>
                                </table>
                            </div>
            </div>
            
        </div>
     

    </div>
     <script type="text/javascript">
            var module = angular.module('myApp', []);
            var str = <jsp:include page="../Membres"></jsp:include>;
            console.log(str[0].membre);
            module.controller('namesCtrl', function ($scope, $http) {
                $scope.names = str;
                // console.log($scope.names);
            });
        </script>

    <!-- jQuery -->
    <script src="../js/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../js/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../js/raphael.min.js"></script>
    <script src="../js/morris.min.js"></script>
  
    <script src="../js/sb-admin-2.js"></script>

</body>

</html>

