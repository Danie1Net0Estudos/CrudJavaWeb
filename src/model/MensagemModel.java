package model;

public class MensagemModel {

    private boolean sucesso;
    private String conteudo;

    public MensagemModel() {
        sucesso = false;
        conteudo = "";
    }

    public MensagemModel(boolean sucesso, String conteudo) {
        this.sucesso = sucesso;
        this.conteudo = conteudo;
    }

    public boolean isSucesso() {
        return sucesso;
    }

    public void setSucesso(boolean sucesso) {
        this.sucesso = sucesso;
    }

    public String getConteudo() {
        return conteudo;
    }

    public void setConteudo(String conteudo) {
        this.conteudo = conteudo;
    }
}
