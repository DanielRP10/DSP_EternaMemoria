<%-- 
    Document   : index
    Created on : 29 oct 2024, 19:14:35
    Author     : predi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/boxicons@2.1.4/css/boxicons.min.css" rel="stylesheet">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css">
        <title>Login</title>
    </head>
    <body>
        <section class="d-flex vh-100 align-items-center gradient-bg">
            <div class="container" name="rowContainer">
                <div class="row shadow rounded bg-white" >
                    <!-- Left Section: Form -->
                    <div class="col-lg-6 p-5 d-flex flex-column justify-content-center">
                        <div class="text-center mb-4">
                            <h3>Login</h3>
                            <p class="text-muted">Ingrese sus credenciales</p>
                        </div>
                        <form action="ControladorUsuario">
                            <div class="form-outline mb-3">
                                <label for="usuario" class="form-label">Usuario</label>
                                <input type="text" id="usuario" name="txtUsuario" class="form-control form-control-lg" placeholder="Ingrese Usuario" />
                            </div>
                            <div class="form-outline mb-3">
                                <label for="contra" class="form-label">Contraseña</label>
                                <input type="password" id="contra" name="txtPassword" class="form-control form-control-lg" placeholder="Ingrese Contraseña" />
                            </div>
                            <div class="text-center">
                                <input type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
                                   style="padding-left: 2.5rem; padding-right: 2.5rem;" name="accion" value="Ingresar">
                            </div>
                        </form>
                    </div>
                    <!-- Right Section: Image -->
                    <div class="col-lg-6 p-0 d-none d-lg-block text-center" name="rightSection">
                        <img src="img/LogoCompleto PNG.png" name="logoFuneraria" alt="Logo Funeraria Eterna Memoria" class="img-fluid rounded-end">
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
