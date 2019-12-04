<%@ page import="data.StatusData" %>
<%@ page import="model.StatusModel" %>
<%@ page import="java.util.List" %>
<%@ page import="model.SalaModel" %>
<%@ page import="model.SubeventoModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Cadastrar Sala</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/datatables/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/css/sb-admin.min.css">
    </head>
    <body id="page-top">
        <nav class="navbar navbar-expand navbar-dark bg-dark static-top">
            <a class="navbar-brand mr-1" href="index.jsp">Eventos</a>

            <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
                <i class="fas fa-bars"></i>
            </button>

            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0"></form>

            <ul class="navbar-nav ml-auto ml-md-0">
                <a class="navbar-brand mr-1" href="#" data-toggle="dropdown">Usuário</a>
                <li class="nav-item dropdown no-arrow">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-user-circle fa-fw"></i>
                    </a>

                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">Minha Conta</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Sair</a>
                    </div>
                </li>
            </ul>
        </nav>

        <div id="wrapper">
            <ul class="sidebar navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="paginaEventos" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-calendar"></i>
                        <span>Eventos</span>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="paginaEventos">
                        <h6 class="dropdown-header">Inscrição:</h6>
                        <a class="dropdown-item" href="/inscricaoPartEvento/List">Eventos</a>
                        <a class="dropdown-item" href="/inscricaoPartSubeve/List">Sub-Eventos</a>

                        <div class="dropdown-divider"></div>
                        <h6 class="dropdown-header">Cadastro:</h6>
                        <a class="dropdown-item" href="/eventos/List">Eventos</a>
                        <a class="dropdown-item" href="/subeventos/List">Sub-Eventos</a>
                        <a class="dropdown-item" href="/editais/List">Editais</a>
                        <a class="dropdown-item" href="/salas/List">Salas</a>
                        <a class="dropdown-item" href="/apresentacao/List">Apresentação</a>
                        <a class="dropdown-item" href="/submissao/List">Submissão</a>
                        <a class="dropdown-item" href="/crachas/List">Crachás</a>
                        <a class="dropdown-item" href="/certificados/List">Certificados</a>
                        <a class="dropdown-item" href="/patrocinios/List">Patrocínios</a>
                        <a class="dropdown-item" href="/patrocinioimagens/List">Imagens Patrocínio</a>
                        <a class="dropdown-item" href="/categoriamidia/List">Categorias Mídias</a>
                        <a class="dropdown-item" href="/midias/List">Mídias</a>

                        <h6 class="dropdown-header">Cadastro:</h6>
                        <a class="dropdown-item" href="/submissao/List">Submissão</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="paginaPresenca" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-check"></i>
                        <span>Presença</span>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="paginaPresenca">
                        <a class="dropdown-item" href="/eventos/List">Eventos</a>
                        <a class="dropdown-item" href="/subeventos/List">Sub-Eventos</a>
                        <a class="dropdown-item" href="/subeventos/List">Equipe Sub-Eventos</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="paginaEquipes" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-users"></i>
                        <span>Equipes</span>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="paginaEquipes">
                        <a class="dropdown-item" href="/eventos/List">Equipes</a>
                        <a class="dropdown-item" href="/subeventos/List">Participantes</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="paginaUsuario" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-user"></i>
                        <span>Usuário</span>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="paginaUsuario">
                        <h6 class="dropdown-header">Cadastro:</h6>
                        <a class="dropdown-item" href="#">Usuários</a>
                        <a class="dropdown-item" href="#">Participantes</a>
                        <a class="dropdown-item" href="#">Organizadores</a>
                        <a class="dropdown-item" href="#">Avaliadores</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="paginaConfig" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-cog"></i>
                        <span>Configurações</span>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="paginaConfig">
                        <h6 class="dropdown-header">Cadastro:</h6>
                        <a class="dropdown-item" href="/status/List">Status</a>
                    </div>
                </li>

                <li class="nav-item dropdown"></li>
            </ul>

            <div id="content-wrapper">
                <div class="container-fluid">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="#">Dashboard</a>
                        </li>

                        <li class="breadcrumb-item">
                            <a href="#">Eventos</a>
                        </li>
                        <li class="breadcrumb-item active">Salas</li>
                    </ol>

                    <%
                        SalaModel salaModel = (SalaModel) request.getSession().getAttribute("sala");
                    %>

                    <div class="row">
                        <div class="col-lg-12 mt-3">
                            <a class="btn btn-info link-btn float-left" href="salas.jsp">
                                <i class="fas fa-arrow-alt-circle-left"></i> Voltar
                            </a>

                            <a class="btn btn-success link-btn float-right" href="form-editar?id=<% out.print(salaModel.getIdSala()); %>">
                                <i class="fas fa-pencil-alt"></i> Editar Sala
                            </a>
                        </div>

                        <div class="col-lg-12 mt-4">
                            <div class="card">
                                <div class="card-header">Visualizar Sala</div>

                                <div class="card-body">
                                    <form action="editar" method="POST">
                                        <div class="form-group">
                                            <label for="descricao">Descrição:</label>
                                            <input type="text" class="form-control" id="descricao" name="descricao" value="<% out.print(salaModel.getDescricao()); %>" placeholder="Descrição da Sala" readonly>
                                        </div>

                                        <div class="form-row">
                                            <div class="col">
                                                <label for="capacidade">Capacidade:</label>
                                                <input type="number" class="form-control" min="1" id="capacidade" name="capacidade" value="<% out.print(salaModel.getCapacidade()); %>" placeholder="Capacidade da Sala" readonly>
                                            </div>

                                            <div class="col">
                                                <label for="status">Status:</label>
                                                <select class="form-control" id="status" name="status" disabled>
                                                    <% out.print("<option>" + salaModel.getStatus().getDescricao() + "</option>"); %>
                                                </select>
                                            </div>
                                        </div>
                                    </form>

                                    <ul class="list-group mt-4">
                                        <li class="list-group-item list-group-item-action list-group-item-secondary" aria-disabled="true">Subeventos Realizados</li>
                                        <%
                                            if (!salaModel.getSubeventos().isEmpty()) {
                                                for (SubeventoModel subeventoModel: salaModel.getSubeventos()) {
                                                    String classBadge = subeventoModel.getStatus().getIdStatus() == 1 ? "badge-success" : "badge-danger";

                                                    out.print("<li class='list-group-item'>");
                                                    out.print(subeventoModel.getNome());
                                                    out.print("<span class='badge " + classBadge + " ml-2'>" + subeventoModel.getStatus().getDescricao() + "</span>");
                                                    out.print("<button class='btn btn-link float-right'><i class='fas fa-eye'></i> Ver Subevento</button>");
                                                    out.print("</li>");
                                                }
                                            } else {
                                                out.print("<li class='list-group-item'>Nenhum subevento foi realizado nessa sala.</li>");
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <footer class="sticky-footer">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright © ADS IFSP 2019</span>
                            </div>
                        </div>
                    </footer>
                </div>
            </div>

            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Deseja realmente sair?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>

                        <div class="modal-body">Clique no botão "Sair" logo abaixo, se deseja realmente sair do sistema.</div>

                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                            <a class="btn btn-primary" href="login.jsp">Sair</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/jquery/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/chart.js/Chart.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/datatables/jquery.dataTables.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/datatables/dataTables.bootstrap4.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/js/sb-admin.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/fontawesome-free/js/all.min.js"></script>

        <script>
            $(document).ready(function () {
                $('#tabelaSalas').DataTable();
            });
        </script>
    </body>
</html>
