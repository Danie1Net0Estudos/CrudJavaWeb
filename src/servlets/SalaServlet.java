package servlets;

import data.SalaData;
import model.MensagemModel;
import model.SalaModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/")
public class SalaServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        String action = request.getServletPath();

        switch (action) {
            case "/salas/cadastrar":
                cadastrarSala(request, response);
                break;
            case "/salas/form-editar":
                formularioEditar(request, response);
                break;
            case "/salas/visualizar":
                visualizarSala(request, response);
                break;
            case "/salas/editar":
                editarSala(request, response);
                break;
            case "/salas/excluir":
                excluirSala(request, response);
                break;
        }
    }

    private void cadastrarSala(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SalaModel salaModel = new SalaModel();
        salaModel.setDescricao(request.getParameter("descricao"));
        salaModel.setCapacidade(Integer.parseInt(request.getParameter("capacidade")));
        salaModel.getStatus().setIdStatus(Integer.parseInt(request.getParameter("status")));
        MensagemModel mensagemModel = null;

        try {
            SalaData salaData = new SalaData();

            if (salaData.cadastrar(salaModel)) {
                mensagemModel = new MensagemModel();
                mensagemModel.setSucesso(true);
                mensagemModel.setConteudo("Sala cadastrada com sucesso!");
            } else {
                mensagemModel = new MensagemModel();
                mensagemModel.setSucesso(false);
                mensagemModel.setConteudo("Erro ao cadastrar sala.");
            }
        } catch (Exception ex) {
            mensagemModel = new MensagemModel();
            mensagemModel.setSucesso(false);
            mensagemModel.setConteudo("Erro inesperado! Tente novamente daqui alguns instantes.");
        }

        request.getSession().setAttribute("mensagem", mensagemModel);
        response.sendRedirect("salas.jsp");
    }

    private void formularioEditar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            SalaData salaData = new SalaData();
            SalaModel salaModel = salaData.buscar(id);

            request.getSession().setAttribute("sala", salaModel);
            response.sendRedirect("editar.jsp");
        } catch (Exception ex) {
            MensagemModel mensagemModel = new MensagemModel();
            mensagemModel.setSucesso(false);
            mensagemModel.setConteudo("Erro inesperado! Tente novamente daqui alguns instantes.");

            request.getSession().setAttribute("mensagem", mensagemModel);
            response.sendRedirect("salas.jsp");
        }
    }

    private void visualizarSala(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            SalaData salaData = new SalaData();
            SalaModel salaModel = salaData.buscar(id);

            request.getSession().setAttribute("sala", salaModel);
            response.sendRedirect("visualizar.jsp");
        } catch (Exception ex) {
            MensagemModel mensagemModel = new MensagemModel();
            mensagemModel.setSucesso(false);
            mensagemModel.setConteudo("Erro inesperado! Tente novamente daqui alguns instantes.");

            request.getSession().setAttribute("mensagem", mensagemModel);
            response.sendRedirect("salas.jsp");
        }
    }

    private void editarSala(HttpServletRequest request, HttpServletResponse response) throws Exception {
        SalaModel salaModel = new SalaModel();
        salaModel.setIdSala(Integer.parseInt(request.getParameter("idSala")));
        salaModel.setDescricao(request.getParameter("descricao"));
        salaModel.setCapacidade(Integer.parseInt(request.getParameter("capacidade")));
        salaModel.getStatus().setIdStatus(Integer.parseInt(request.getParameter("status")));
        MensagemModel mensagemModel = null;

        try {
            SalaData salaData = new SalaData();

            if (salaData.editar(salaModel)) {
                mensagemModel = new MensagemModel();
                mensagemModel.setSucesso(true);
                mensagemModel.setConteudo("Sala editada com sucesso!");
            } else {
                mensagemModel = new MensagemModel();
                mensagemModel.setSucesso(false);
                mensagemModel.setConteudo("Erro ao editar sala.");
            }
        } catch (Exception ex) {
            mensagemModel = new MensagemModel();
            mensagemModel.setSucesso(false);
            mensagemModel.setConteudo("Erro inesperado! Tente novamente daqui alguns instantes.");
        }

        request.getSession().setAttribute("mensagem", mensagemModel);
        response.sendRedirect("salas.jsp");
    }

    private void excluirSala(HttpServletRequest request, HttpServletResponse response) throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        MensagemModel mensagemModel = null;

        try {
            SalaData salaData = new SalaData();

            if (salaData.excluir(id)) {
                mensagemModel = new MensagemModel();
                mensagemModel.setSucesso(true);
                mensagemModel.setConteudo("Sala excluída com sucesso!");
            } else {
                mensagemModel = new MensagemModel();
                mensagemModel.setSucesso(false);
                mensagemModel.setConteudo("A sala não pode ser excluída pois está vinculada a eventos.");
            }
        } catch (Exception ex) {
            mensagemModel = new MensagemModel();
            mensagemModel.setSucesso(false);
            mensagemModel.setConteudo("Erro inesperado! Tente novamente daqui alguns instantes.");
        }

        request.getSession().setAttribute("mensagem", mensagemModel);
        response.sendRedirect("salas.jsp");
    }

}
