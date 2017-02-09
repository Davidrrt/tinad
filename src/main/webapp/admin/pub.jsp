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

                           
                            <li>
                                <a href="membres.jsp"><i class="fa fa-users  fa-fw"></i>Gestion membres</a>
                            </li>
                            <li class="active">
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
                            <form method="POST" action="http://serverimg.alwaysdata.net/traitementpub.php">
                            <div class="panel-body" style="margin-bottom: 263px;">
                                <h4>Nouvelle publicité</h4>
                               <input type="text" placeholder="titre"  name="titre" class="form-control">
                               <br>
                                <select class="form-control" name="type">
                                    <option value="1">mobile</option>
                                    <option value="2">site gauche</option>
                                    <option value="3">site haut</option>
                                </select>
                                <br>
                                <br>
                                <input type="submit" class="btn btn-primary">
                            </div>
                            </form>
                            <!-- /.panel-body -->
                        </div>

                    </div>
                   
                <div class="col-lg-6" ng-app="myApp" ng-controller="namesCtrl">
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
                                       
                                    </tr>
                                </thead>
                                <tr>
                                    <td><img src="http://serverimg.alwaysdata.net/img/{{names[0].publicite[0].img}}" width="60" height="60"></td>
                                    <td>{{names[0].publicite[0].titre}}</td>
                                    
                                </tr>
                            </table>
                             <h4>Banniere Gauche</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>image</th>
                                        <th>titre</th>
                                       
                                    </tr>
                                </thead>
                                <tr>
                                       <td><img src="http://serverimg.alwaysdata.net/img/{{names[0].publicite[1].img}}" width="60" height="60"></td>
                                    <td>{{names[0].publicite[1].titre}}</td>
                               
                                </tr>
                            </table>
                              <h4>Banniere haut de page</h4>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>image</th>
                                        <th>titre</th>
                                        
                                    </tr>
                                </thead>
                                <tr>
                                    <td><img src="http://serverimg.alwaysdata.net/img/{{names[0].publicite[2].img}}" width="60" height="60"></td>
                                    <td>{{names[0].publicite[2].titre}}</td>
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
          <%
        String currPage = "/pub";
    %>
    <script type="text/javascript">
        var module = angular.module('myApp', []);
        var str = <jsp:include page="<%=currPage%>"></jsp:include>;
        console.log(str);
        module.controller('namesCtrl', function ($scope, $http) {
            $scope.names = str;
        });
        </script>

        <!-- Morris Charts JavaScript -->

        <script src="../js/sb-admin-2.js"></script>

    </body>

</html>

