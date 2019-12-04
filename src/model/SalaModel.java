package model;

import java.util.ArrayList;
import java.util.List;

public class SalaModel {

    private int idSala;
    private String descricao;
    private int capacidade;
    private StatusModel status;
    private List<SubeventoModel> subeventos;

    public SalaModel() {
        idSala = 0;
        descricao = "";
        capacidade = 0;
        status = new StatusModel();
        subeventos = new ArrayList<>();
    }

    public SalaModel(int idSala, String descricao, int capacidade, StatusModel status, List<SubeventoModel> subeventos) {
        this.idSala = idSala;
        this.descricao = descricao;
        this.capacidade = capacidade;
        this.status = status;
        this.subeventos = subeventos;
    }

    public int getIdSala() {
        return idSala;
    }

    public void setIdSala(int idSala) {
        this.idSala = idSala;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getCapacidade() {
        return capacidade;
    }

    public void setCapacidade(int capacidade) {
        this.capacidade = capacidade;
    }

    public StatusModel getStatus() {
        return status;
    }

    public void setStatus(StatusModel status) {
        this.status = status;
    }

    public List<SubeventoModel> getSubeventos() {
        return subeventos;
    }

    public void setSubeventos(List<SubeventoModel> subeventos) {
        this.subeventos = subeventos;
    }

}
