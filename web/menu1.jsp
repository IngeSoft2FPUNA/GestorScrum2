<!DOCTYPE html>

<html>
    <head>
        <title>GESTOR SCRUM</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap-theme.css" type="text/css"/>
        <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="css/estilos.css" type="text/css">
    </head>
    <body>

        <!--    BARRA NAVEGACION-->
        <nav class="navbar navbar-default">
            <div class ="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapse" 
                            data-toggle="collapse"
                            data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">DASHBOARD</a>
                </div>
                <div class="collpase navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle"
                               data-toggle="dropdown" role="button"
                               >Menu<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="frm/archivos/usuarios">Usuarios</a></li>
                                <li><a href="frm/archivos/proyectos">Proyectos</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" 
                               class="dropdown-toggle" 
                               data-toggle="dropdown"
                               role="button">
                                <span id="susuario_usuario"></span>
                                <span id="id_usuario"></span>
                                <span class="caret">                                       
                                </span>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="index.html">Salir</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!--    PRODUCT BACKLOG-->
        <div id="panelBacklog"></div>  

        <!--    SPRINT BACKLOG-->
        <div id="panelSprintBacklog"></div>  

        <!--    AGREGAR US-->
        <div id="panelAgregarUS"></div>  

        <!--    PANEL MIS PROYECTOS-->
        <div id="panelMisProyectos" class="panel panel-primary">
            <div class="panel-heading centrado">Mis Proyectos</div>
            <div class="panel-body">
                <form id="formBuscar">
                    <input type="hidden" id="bpagina" name="bpagina" value="1"/>
                    <div class="row">
                        <div class="col-md-1">
                            <span>Nombre</span>                        
                        </div>
                        <div class="col-md-9">
                            <input id="bnombre_proyecto" name="bnombre_proyecto" type="text" class="form-control input-sm" placeholder="Nombre"/>                        
                        </div>
                        <div class="col-md-2">
                            <button id="botonBuscar" type="button" class="btn btn-primary btn-sm" >
                                <span class='glyphicon glyphicon-search'></span>
                            </button>                        
                        </div>
                    </div>
                </form>

                <!--        TABLA DE RESULTADOS-->
                <div id="resultado">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Descripcion</th>
                                <th>Fecha de Entrega</th>
                                <th>Rol</th>
                                <th class="centrado" colspan="3">Accion</th>
                            </tr>
                        </thead>
                        <tbody id="contenidoBusqueda">                            
                        </tbody>
                    </table>
                    <nav>
                        <ul class="pager">
                            <li id="anterior"><a href="#"><span aria-hidden="true">&larr;</span></a>Anterior</li>
                            <li id="siguiente"><a href="#">Siguiente<span aria-hidden="true">&rarr;</span></a></li>                        
                        </ul>
                    </nav>
                </div>
            </div>       
        </div>    
        <!--    PANEL MI ACTIVIDAD-->
        <div id="panelMisProyectos" class="panel panel-primary">
            <div class="panel-heading centrado">Mi Actividad</div>
            <div class="panel-body">

                <!--TABLA DE RESULTADOS-->
                <div id="resultado">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Proyecto</th>
                                <th>US</th>
                                <th>Prioridad</th>
                                <th>Tiempo Trabajado</th>
                                <th>Estado</th>
                                <th class="centrado" colspan="3">Accion</th>
                            </tr>
                        </thead>
                        <tbody id="contenidoBusqueda">                            
                        </tbody>
                    </table>
                </div>
            </div>       
        </div>    

        <!--    MENSJADES DEL SISTEMA-->
        <div id="mensajes" class="well well-sm centrado">Mensajes del Sistema</div>


        <script src = "js/jquery.min.js" type="text/javascript"></script>
        <script src = "js/bootstrap.min.js" type="text/javascript"></script>
        <script src = "js/funciones.js" type="text/javascript"></script>

        <script>
            verificarSesion();
            buscarMisProyecto();

            $("#bnombre_proyecto").focus();
            //siguienteCampo("#bnombre_proyecto","#botonBuscar",false);

            $("#botonBuscar").on("click", function () {
                $("#contenidoBusqueda").html("");
                $("#bpagina").val("1");
                buscarMisProyecto();
                $("#bnombre_proyecto").focus();
            });

            $("#anterior").on("click", function () {
                $("#contenidoBusqueda").html("");
                var pag = parseInt($("#bpagina").val());
                if (pag > 1) {
                    $("#bpagina").val(pag - 1);
                }
                buscarMisProyecto();
            });

            $("#siguiente").on("click", function () {
                $("#contenidoBusqueda").html("");
                var pag = parseInt($("#bpagina").val());
                $("#bpagina").val(pag + 1);
                buscarMisProyecto();
            });

        </script>

    </body>
</html>
