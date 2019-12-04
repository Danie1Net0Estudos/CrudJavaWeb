<%@ page import="data.SalaData" %>
<%@ page import="model.SalaModel" %>
<%@ page import="java.util.List" %>
<%@ page import="model.MensagemModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Salas</title>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/fontawesome-free/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/vendor/datatables/dataTables.bootstrap4.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/startbootstrap-sb-admin@5.1.1/css/sb-admin.min.css">
        <link rel="stylesheet" href="sweetalert2.min.css">
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
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <a class="nav-link dropdown-toggle" href="#" id="paginaEventos" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <a class="nav-link dropdown-toggle" href="#" id="paginaPresenca" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <a class="nav-link dropdown-toggle" href="#" id="paginaEquipes" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <i class="fas fa-fw fa-users"></i>
                        <span>Equipes</span>
                    </a>

                    <div class="dropdown-menu" aria-labelledby="paginaEquipes">
                        <a class="dropdown-item" href="/eventos/List">Equipes</a>
                        <a class="dropdown-item" href="/subeventos/List">Participantes</a>
                    </div>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="paginaUsuario" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                    <a class="nav-link dropdown-toggle" href="#" id="paginaConfig" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                        MensagemModel mensagem = (MensagemModel) request.getSession().getAttribute("mensagem");

                        if (mensagem != null) {
                            String classAlert = mensagem.isSucesso() ? "alert-success" : "alert-danger";

                            out.print("<div class='alert " + classAlert + " alert-dismissible fade show mt-4' role='alert'>" +
                                        mensagem.getConteudo() +
                                        "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>" +
                                          "<span aria-hidden='true'>&times;</span>" +
                                        "</button>" +
                                      "</div>");

                            request.getSession().setAttribute("mensagem", null);
                        }
                    %>

                    <div class="row">
                        <div class="col-lg-12 mt-3">
                            <a class="btn btn-success link-btn float-right" href="cadastrar.jsp">
                                <i class="fas fa-plus-circle"></i> Cadastrar Sala
                            </a>
                        </div>

                        <div class="col-lg-12 mt-4 mb-4">
                            <table class="table" id="tabelaSalas">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Descrição</th>
                                    <th>Capacidade</th>
                                    <th>Status</th>
                                    <th>Ações</th>
                                </tr>
                                </thead>

                                <tbody>
                                <%
                                    try {
                                        SalaData salaData = new SalaData();
                                        List<SalaModel> salas = salaData.listar();

                                        for (SalaModel sala: salas) {
                                            String classBadge = sala.getStatus().getIdStatus() == 1 ? "badge-success" : "badge-danger";

                                            out.print("<tr>");
                                            out.print("<td>" + sala.getIdSala() + "</td>");
                                            out.print("<td>" + sala.getDescricao() + "</td>");
                                            out.print("<td>" + sala.getCapacidade() + "</td>");
                                            out.print("<td><span class='badge " + classBadge + "'>" + sala.getStatus().getDescricao() + "</span></td>");
                                            out.print("<td>");
                                            out.print("<a class='btn btn-primary' href='form-editar?id=" + sala.getIdSala() + "'><i class='fas fa-pencil-alt'></i> Editar</a>");
                                            out.print("<button class='btn btn-danger ml-2' onclick='excluirSala(" + sala.getIdSala() + ")'><i class='fas fa-times-circle'></i> Excluir</button>");
                                            out.print("<a class='btn btn-success ml-2' href='visualizar?id=" + sala.getIdSala() + "'><i class='fas fa-eye'></i> Ver Detalhes</a>");
                                            out.print("</td>");
                                            out.print("</tr>");
                                        }
                                    } catch (Exception ex) {
                                        out.print("<div class='alert alert-danger'>Erro ao listar salas!</div>");
                                    }
                                %>
                                </tbody>
                            </table>
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

            <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
        <script src="sweetalert2.all.min.js"></script>

        <script>
            $(document).ready(function() {
                $('#tabelaSalas').DataTable();
            });

            $("#tabelaSalas").dataTable({
                "bJQueryUI": true,
                "oLanguage": {
                    "sProcessing":   "Processando...",
                    "sLengthMenu":   "Mostrar _MENU_ registros",
                    "sZeroRecords":  "Não foram encontrados resultados",
                    "sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty":    "Mostrando de 0 até 0 de 0 registros",
                    "sInfoFiltered": "",
                    "sInfoPostFix":  "",
                    "sSearch":       "Buscar:",
                    "sUrl":          "",
                    "oPaginate": {
                        "sFirst":    "Primeiro",
                        "sPrevious": "Anterior",
                        "sNext":     "Seguinte",
                        "sLast":     "Último"
                    }
                }
            });

            function excluirSala(id) {
                Swal.fire({
                    icon: 'question',
                    title: 'Excluir Sala',
                    text: 'Você quer mesmo excluir essa sala?',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sim, excluir',
                    cancelButtonText: 'Não, cancelar'
                }).then(result => {
                    if (result.value) {
                        window.location.href = 'excluir?id=' + id;
                    }
                });
            }
        </script>
    </body>
</html>
