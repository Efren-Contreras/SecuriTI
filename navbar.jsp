<%@ page contentType="text/html; charset=UTF-8" %>
<nav class="navbar navbar-expand-lg " style="background-color: #5FAAF2;">
    <div class="container-fluid">
        <a href="dashboard.jsp"><img src="resources/IMG/securiTI.png" alt="SecuriTI"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="dashboard.jsp">Empresas</a>
                </li>
                <%
                if (userlevel.equals("root") || userlevel.equals("admin") ){
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="?idpage=cuentas#profile">Cuentas</a>
                    </li>
                    <%
                } else { 
                %>
                    <li class="nav-item">
                        <a class="nav-link" href="?idpage=cuentas#profile">Perfil</a>
                    </li>
                <%
                }
                if (userlevel.equals("root") || userlevel.equals("admin") ){
                    %>
                    <li class="nav-item">
                        <a class="nav-link" href="?idpage=logs">Bitácora</a>
                    </li>
                    <%
                }
                %>
            </ul>
            <form class="ms-auto" action="dashboard/Controller/Process/logout.jsp">
                <button class="btn btn-outline-danger" type="submit">Cerrar Sesión</button>
            </form>
        </div>
    </div>
</nav>