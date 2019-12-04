package data;

import model.StatusModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StatusData {

    public List<StatusModel> listar() throws Exception {
        Connection conexao = Conexao.abrirConexao();
        List<StatusModel> statusList = new ArrayList<>();

        String sqlBusca = "SELECT * FROM STATUS";

        PreparedStatement psBusca = conexao.prepareStatement(sqlBusca);
        ResultSet rsBusca = psBusca.executeQuery();

        if (rsBusca.next()) {
            do {
                StatusModel statusModel = new StatusModel();
                statusModel.setIdStatus(rsBusca.getInt("IDSTATUS"));
                statusModel.setDescricao(rsBusca.getString("DESCRICAO"));
                statusList.add(statusModel);
            } while (rsBusca.next());
        }

        Conexao.fecharConexao(conexao, psBusca, rsBusca);

        return statusList;
    }

}
