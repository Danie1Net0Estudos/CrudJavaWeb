package data;

import java.sql.*;

class Conexao {

    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";
    private static final String HOST = "127.0.0.1";
    private static final String BANCO = "projeto_lp2";
    private static final String USUARIO = "daniel";
    private static final String SENHA = "mypass2200";

    static Connection abrirConexao() throws SQLException, ClassNotFoundException {
        Class.forName(DRIVER);
        return DriverManager.getConnection("jdbc:mysql://" + Conexao.HOST + "/" + Conexao.BANCO, Conexao.USUARIO, Conexao.SENHA);
    }
    
    static void fecharConexao(Connection connection) throws SQLException {
        if (connection != null) {
            connection.close();
        }
    }
    
    static void fecharConexao(PreparedStatement preparedStatement) throws SQLException {
        if (preparedStatement != null) {
            preparedStatement.close();
        }
    }
    
    static void fecharConexao(ResultSet resultSet) throws SQLException {
        if (resultSet != null) {
            resultSet.close();
        }
    }
    
    static void fecharConexao(PreparedStatement preparedStatement, ResultSet resultSet) throws SQLException {
        Conexao.fecharConexao(resultSet);
        Conexao.fecharConexao(preparedStatement);
    }
    
    static void fecharConexao(Connection connection, PreparedStatement preparedStatement) throws SQLException {
        Conexao.fecharConexao(connection);
        Conexao.fecharConexao(preparedStatement);
    }
    
    static void fecharConexao(Connection connection, ResultSet resultSet) throws SQLException {
        Conexao.fecharConexao(connection);
        Conexao.fecharConexao(resultSet);
    }
    
    static void fecharConexao(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet) throws SQLException {
        Conexao.fecharConexao(connection);
        Conexao.fecharConexao(preparedStatement);
        Conexao.fecharConexao(resultSet);
    }
    
    static int ultimoId(Connection conexao, String tabela, String chave) throws SQLException, ClassNotFoundException {
        int id = 0;
        
        PreparedStatement psBuscarId = conexao.prepareStatement("SELECT max(" + chave + ") as " + chave + " FROM " + tabela);
        ResultSet rsBuscarId = psBuscarId.executeQuery();
        
        if (rsBuscarId.next()) {
            id = rsBuscarId.getInt(chave);
        }
        
        fecharConexao(psBuscarId, rsBuscarId);
        
        return id;
    }
    
}
