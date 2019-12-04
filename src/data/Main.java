package data;

import model.SalaModel;

import java.util.List;

public class Main {

    public static void main(String[] args) throws Exception {
        SalaData salaData = new SalaData();
        SalaModel sala = salaData.buscar(1);
    }

}
