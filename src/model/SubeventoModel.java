package model;

public class SubeventoModel {

    private int idSubevento;
    private String nome;
    private String descricao;
    private StatusModel status;

    public SubeventoModel() {
        idSubevento = 0;
        nome = "";
        descricao = "";
        status = new StatusModel();
    }

    public SubeventoModel(int idSubevento, String nome, String descricao, StatusModel status) {
        this.idSubevento = idSubevento;
        this.nome = nome;
        this.descricao = descricao;
        this.status = status;
    }

    public int getIdSubevento() {
        return idSubevento;
    }

    public void setIdSubevento(int idSubevento) {
        this.idSubevento = idSubevento;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public StatusModel getStatus() {
        return status;
    }

    public void setStatus(StatusModel status) {
        this.status = status;
    }

}
