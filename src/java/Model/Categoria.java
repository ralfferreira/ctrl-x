package Model;

public class Categoria {

    private int Id;
    private String Nome;
    private int User;
    
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
     * @return the Nome
     */
    public String getNome() {
        return Nome;
    }

    /**
     * @param Nome the Nome to set
     */
    public void setNome(String Nome) {
        this.Nome = Nome;
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
