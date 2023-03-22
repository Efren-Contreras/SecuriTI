<%@ page contentType="text/html; charset=UTF-8" %>
<nav class="navbar navbar-expand-lg " style="background-color: #e3f2fd;">
    <div class="container-fluid">
        <a href="dashboard.jsp"><img src="Fichero/IMG/securiTI.png" alt="SecuriTI"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="dashboard.jsp" onclick="VerInicio()">Inicio</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?idpage=productos">Productos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?idpage=precios">Precios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="?idpage=cuentas">Cuentas</a>
                </li>
            </ul>
        </div>
    </div>
    <form class="container-fluid justify-content-end" action="ogout.jsp">
        <button class="btn btn-outline-danger" type="submit">Cerrar Sesión</button>
        
    </form>
</nav>
