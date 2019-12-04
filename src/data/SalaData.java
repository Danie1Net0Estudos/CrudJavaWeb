package data;

import model.SalaModel;
import model.SubeventoModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class SalaData {

    public List<SalaModel> listar() throws Exception {
        Connection conexao = Conexao.abrirConexao();
        List<SalaModel> salas = new ArrayList<>();

        String sqlListar = "SELECT sala.*, status.* FROM SALAS sala INNER JOIN STATUS status ON (sala.IDSTATUS = status.IDSTATUS)";

        PreparedStatement psListar = conexao.prepareStatement(sqlListar);
        ResultSet rsListar = psListar.executeQuery();

        if (rsListar.next()) {
            do {
                SalaModel salaModel = new SalaModel();
                salaModel.setIdSala(rsListar.getInt("sala.IDSALA"));
                salaModel.setDescricao(rsListar.getString("sala.DESCRICAO"));
                salaModel.setCapacidade(rsListar.getInt("sala.CAPACIDADETOTAL"));
                salaModel.getStatus().setIdStatus(rsListar.getInt("status.IDSTATUS"));
                salaModel.getStatus().setDescricao(rsListar.getString("status.DESCRICAO"));
                salas.add(salaModel);
            } while (rsListar.next());
        }

        Conexao.fecharConexao(conexao, psListar, rsListar);

        return salas;
    }

    public boolean cadastrar(SalaModel salaModel) throws Exception {
        Connection conexao = Conexao.abrirConexao();

        String sqlCadastrar = "INSERT INTO SALAS (DESCRICAO, CAPACIDADETOTAL, IDSTATUS) VALUES (?, ?, ?)";

        PreparedStatement psCadastrar = conexao.prepareStatement(sqlCadastrar);
        psCadastrar.setString(1, salaModel.getDescricao());
        psCadastrar.setInt(2, salaModel.getCapacidade());
        psCadastrar.setInt(3, salaModel.getStatus().getIdStatus());

        if (psCadastrar.executeUpdate() == 0) {
            Conexao.fecharConexao(conexao, psCadastrar);
            return false;
        }

        Conexao.fecharConexao(conexao, psCadastrar);

        return true;
    }

    public SalaModel buscar(int id) throws Exception {
        Connection conexao = Conexao.abrirConexao();
        SalaModel salaModel = null;

        String sqlBuscar = "SELECT sala.*, status.* FROM SALAS sala INNER JOIN STATUS status ON (sala.IDSTATUS = status.IDSTATUS) WHERE sala.IDSALA = ?";

        PreparedStatement psBuscar = conexao.prepareStatement(sqlBuscar);
        psBuscar.setInt(1, id);

        ResultSet rsBuscar = psBuscar.executeQuery();

        if (rsBuscar.next()) {
            salaModel = new SalaModel();
            salaModel.setIdSala(rsBuscar.getInt("sala.IDSALA"));
            salaModel.setDescricao(rsBuscar.getString("sala.DESCRICAO"));
            salaModel.setCapacidade(rsBuscar.getInt("sala.CAPACIDADETOTAL"));
            salaModel.getStatus().setIdStatus(rsBuscar.getInt("status.IDSTATUS"));
            salaModel.getStatus().setDescricao(rsBuscar.getString("status.DESCRICAO"));

            String sqlListarSubeventos = "SELECT subevento.IDSUBEVENTO, subevento.NOME, subevento.DESCRICAO, subevento.IDSALA, status.* FROM SUBEVENTOS subevento " +
                                             "INNER JOIN STATUS status ON (subevento.IDSTATUS = status.IDSTATUS) " +
                                         "WHERE subevento.IDSALA = " + salaModel.getIdSala();

            PreparedStatement psListarSubeventos = conexao.prepareStatement(sqlListarSubeventos);
            ResultSet rsListarSubeventos = psListarSubeventos.executeQuery();

            if (rsListarSubeventos.next()) {
                List<SubeventoModel> subeventos = new ArrayList<>();

                do {
                    SubeventoModel subeventoModel = new SubeventoModel();
                    subeventoModel.setIdSubevento(rsListarSubeventos.getInt("IDSUBEVENTO"));
                    subeventoModel.setNome(rsListarSubeventos.getString("NOME"));
                    subeventoModel.setDescricao(rsListarSubeventos.getString("DESCRICAO"));
                    subeventoModel.getStatus().setIdStatus(rsBuscar.getInt("status.IDSTATUS"));
                    subeventoModel.getStatus().setDescricao(rsBuscar.getString("status.DESCRICAO"));
                    subeventos.add(subeventoModel);
                } while (rsListarSubeventos.next());

                Conexao.fecharConexao(psListarSubeventos, rsListarSubeventos);

                salaModel.setSubeventos(subeventos);
            }
         }

        Conexao.fecharConexao(conexao, psBuscar, rsBuscar);

        return salaModel;
    }

    public boolean editar(SalaModel salaModel) throws Exception {
        Connection conexao = Conexao.abrirConexao();

        String sqlEditar = "UPDATE SALAS SET DESCRICAO = ?, CAPACIDADETOTAL = ?, IDSTATUS = ? WHERE IDSALA = ?";

        PreparedStatement psEditar = conexao.prepareStatement(sqlEditar);
        psEditar.setString(1, salaModel.getDescricao());
        psEditar.setInt(2, salaModel.getCapacidade());
        psEditar.setInt(3, salaModel.getStatus().getIdStatus());
        psEditar.setInt(4, salaModel.getIdSala());

        if (psEditar.executeUpdate() == 0) {
            Conexao.fecharConexao(conexao, psEditar);
            return false;
        }

        Conexao.fecharConexao(conexao, psEditar);

        return true;
    }

    public boolean excluir(int id) throws Exception {
        Connection conexao = Conexao.abrirConexao();

        String sqlBuscarSubeventos = "SELECT IDSUBEVENTO FROM SUBEVENTOS WHERE IDSALA = ?";

        PreparedStatement psBuscarSubeventos = conexao.prepareStatement(sqlBuscarSubeventos);
        psBuscarSubeventos.setInt(1, id);

        ResultSet rsBuscarSubeventos = psBuscarSubeventos.executeQuery();

        if (rsBuscarSubeventos.next()) {
            Conexao.fecharConexao(conexao, psBuscarSubeventos, rsBuscarSubeventos);
            return false;
        }

        String sqlExcluirSala = "DELETE FROM SALAS WHERE IDSALA = ?";

        PreparedStatement psExcluirSala = conexao.prepareStatement(sqlExcluirSala);
        psExcluirSala.setInt(1, id);

        if (psExcluirSala.executeUpdate() == 0) {
            Conexao.fecharConexao(conexao, psBuscarSubeventos, rsBuscarSubeventos);
            return false;
        }

        return true;
    }

}
