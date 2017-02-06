<%-- 
    Document   : membres
    Created on : 6 févr. 2017, 11:13:44
    Author     : davra
--%>

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

                           
                            <li>
                                <a href="membres.jsp"><i class="fa fa-users  fa-fw"></i>Gestion membres</a>
                            </li>
                            <li class="active">
                                <a href="pub.jsp"><i class="fa fa-file fa-fw"></i>Gestion publicité</a>
                            </li>
                            <li>
                                <a href="evenement.jsp"><i class="fa fa-subway fa-fw"></i>Création évenement</a>
                            </li>
                            <li>
                                  <a href="evenement.jsp"><i class="fa fa-power-off fa-fw"></i>Deconnexion</a>
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
                        <h1 class="page-header">Modification publicité</h1>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /.row -->

                <div class="row">

                    <div class="col-lg-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                               Ajout pub
                            </div>
                            <!-- /.panel-heading -->
                            <div class="panel-body" style="margin-bottom: 263px;">
                                <h4>Nouvelle publicité</h4>
                               <input type="text" placeholder="titre" class="form-control">
                               <br>
                                <select class="form-control" name="select">
                                    <option>mobile</option>
                                    <option>site gauche</option>
                                    <option>site haut</option>
                                </select>
                                <br>
                               
                                  <input type="file" class="form-control" name="file">
                                <br>
                                <input type="submit" class="btn btn-primary">
                            </div>
                            <!-- /.panel-body -->
                        </div>

                    </div>
                   
                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Historique
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">

                            <h4>Banniere mobile</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>image</th>
                                        <th>titre</th>
                                        <th>date pub</th>
                                        <th>action</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td><img src="" width="60" height="60"></td>
                                    <td>Fête saint valentin</td>
                                    <td>02/02/2017</td>
                                    <td>  <input type="button" class="btn btn-default" value="desactiver"></td>
                                </tr>
                            </table>
                             <h4>Banniere Gauche</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>image</th>
                                        <th>titre</th>
                                        <th>date pub</th>
                                        <th>action</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td><img src="" width="60" height="60"></td>
                                    <td>Fête saint valentin</td>
                                    <td>02/02/2017</td>
                                    <td>  <input type="button" class="btn btn-default" value="desactiver"></td>
                                </tr>
                            </table>
                              <h4>Banniere haut de page</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>image</th>
                                        <th>titre</th>
                                        <th>date pub</th>
                                        <th>action</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <td><img src="" width="60" height="60"></td>
                                    <td>Fête saint valentin</td>
                                    <td>02/02/2017</td>
                                    <td>  <input type="button" class="btn btn-default" value="desactiver"></td>
                                </tr>
                            </table>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                     </div>
                </div>

            </div>


        </div>


        <!-- jQuery -->
        <script src="../js/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="../js/metisMenu.min.js"></script>

        <!-- Morris Charts JavaScript -->

        <script src="../js/sb-admin-2.js"></script>

    </body>

</html>

