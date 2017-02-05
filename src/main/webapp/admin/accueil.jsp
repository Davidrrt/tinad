<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <!-- Custom CSS -->
        <link href="../css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script src="../js/angular.min.js"></script>



    </head>

    <body>

        <div id="wrapper" >

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
                                <a href="index.jsp"><i class="fa fa-list fa-fw"></i>Boost d'annonces</a>
                            </li>
                            <li>
                                <a href="patient.jsp"><i class="fa fa-users  fa-fw"></i>Gestion membres</a>
                            </li>
                            <li>
                                <a href="facture.jsp"><i class="fa fa-file fa-fw"></i>Gestion publicité</a>
                            </li>
                             <li>
                                <a href="ajoututilisateur.jsp"><i class="fa fa-users fa-fw"></i>Création évenement</a>
                            </li>
                            
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>
            <div id="page-wrapper" >
                <div class="container-fluid"  ng-app="myApp"  ng-controller="namesCtrl">
                    <form method="POST" action="Employe.jsp">
              
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Liste des employés</h1>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <div class="row">
                            <h3>Recherche</h3><hr>
                            <div class="col-md-10 ">
                                <div class="col-lg-4">
                                    <div class="col-lg-6">
                                        <label>Nom ou poste :</label>
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" class="form-control" ng-model="tes" />
                                    </div>
                                </div>


                                <div class="col-lg-4">
                                    <div class="col-lg-5">
                                        <label>profession :</label></div>
                                    <div class="col-lg-6">
                                        <select class="form-control" ng-model="test1" >
                                            <option value="0"></option>
                                            <option value="1">docteur</option>
                                            <option value="2">infirmiere</option>
                                            <option value="3">pharmacien</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="col-lg-5">
                                        <label>par date :</label>
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="date" class="form-control" />
                                    </div>
                                </div>


                            </div>

                        </div>
                        <div class="row">
                            <hr> <br>
                        </div>
                        <!-- /.row -->

                        <div class="row">
                            <div class="col-lg-6 col-lg-offset-2">

                                <div class="col-lg-3">
                                    <label><p>Nouveau Employe:</p></label>
                                </div>
                                <div class="col-lg-7">
                                    <select class="form-control" name="select">
                                        <option value="1">Medecin</option>
                                        <option value="2">Infirmiere</option>
                                        <option value="3">Pharmacien</option>
                                    </select>
                                </div>
                                <div class="col-lg-1">
                                    <button class="btn btn-info" type="submit" name="ajout">Ajouter</button>
                                </div>
                                  <div class="col-lg-1">
                                    <input type="button" class="btn btn-default" style="margin-left: 20px" onclick="document.location='restaure.jsp'" value="restaurer">
                                </div>

                            </div>
                        </div>
                        <div class="row"><br></div>
                        <div class="row">
                            <div class="col-lg-8 col-lg-offset-2">
                                <table class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>id</th>
                                        <th>Nom</th>
                                        <th>Profession</th>
                                        <th>Poste</th>
                                        <th>date</th>
                                        <th>modification</th>
                                        <th>suppression</th>
                                    </tr>
                                    </thead>
                                    <tr ng-repeat="x in names| control:test1 | filter:tes">
                                        <td >{{x.id}}</td>
                                        <td>{{x.nom}}</td>
                                        <td>{{x.metier}}</td>
                                        <td>{{x.poste}}</td>
                                        <td>{{x.date}}</td>

                                        <td><button value="{{x.id}}" class="btn btn-primary" name="modifier">Modifier</button></td>
                                        <td><button value="{{x.autre}}" name="supprimer" class="btn btn-danger">supprimer</button></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="../js/sb-admin-2.js"></script>

    </body>

</html>


