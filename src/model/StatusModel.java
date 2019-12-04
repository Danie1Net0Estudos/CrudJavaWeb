package model;

public class StatusModel {

    private int idStatus;
    private String descricao;

    public StatusModel() {
        idStatus = 0;
        descricao = "";
    }

    public StatusModel(int idStatus, String descricao) {
        this.idStatus = idStatus;
        this.descricao = descricao;
    }

    public int getIdStatus() {
        return idStatus;
    }

    public void setIdStatus(int idStatus) {
        this.idStatus = idStatus;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

}
