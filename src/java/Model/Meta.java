package Model;

import java.sql.Date;

public class Meta {
    
    private int Id;
    private String Descricao;
    private Date Dt_Inicio;
    private Date Dt_Termino;
    private double Valor;
    private String Nome_Cat;
    private int Categoria;
    private int User;
    
    /**
     * @return the Nome_Cat
     */
    public String getNome_Cat() {
        return Nome_Cat;
    }

    /**
     * @param Nome_Cat the Nome_Cat to set
     */
    public void setNome_Cat(String Nome_Cat) {
        this.Nome_Cat = Nome_Cat;
    }
    
    /**
     * @return the Dt_Inicio
     */
    public Date getDt_Inicio() {
        return Dt_Inicio;
    }

    /**
     * @param Dt_Inicio the Dt_Inicio to set
     */
    public void setDt_Inicio(Date Dt_Inicio) {
        this.Dt_Inicio = Dt_Inicio;
    }

    /**
     * @return the Dt_Termino
     */
    public Date getDt_Termino() {
        return Dt_Termino;
    }

    /**
     * @param Dt_Termino the Dt_Termino to set
     */
    public void setDt_Termino(Date Dt_Termino) {
        this.Dt_Termino = Dt_Termino;
    }
    
    /**
     * @return the Id
     */
    public int getId() {
        return Id;
    }

    /**
     * @param Id the Id to set
     */
    public void setId(int Id) {
        this.Id = Id;
    }

    /**
     * @return the Descricao
     */
    public String getDescricao() {
        return Descricao;
    }

    /**
     * @param Descricao the Descricao to set
     */
    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

    /**
     * @return the Valor
     */
    public double getValor() {
        return Valor;
    }

    /**
     * @param Valor the Valor to set
     */
    public void setValor(double Valor) {
        this.Valor = Valor;
    }

    /**
     * @return the Categoria
     */
    public int getCategoria() {
        return Categoria;
    }

    /**
     * @param Categoria the Categoria to set
     */
    public void setCategoria(int Categoria) {
        this.Categoria = Categoria;
    }

    /**
     * @return the User
     */
    public int getUser() {
        return User;
    }

    /**
     * @param User the User to set
     */
    public void setUser(int User) {
        this.User = User;
    }
    
    
}
