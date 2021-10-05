package Model;

public class Grafico_Info {

    /**
     * @return the Meta
     */
    public double getMeta() {
        return Meta;
    }

    /**
     * @param Meta the Meta to set
     */
    public void setMeta(double Meta) {
        this.Meta = Meta;
    }

    /**
     * @return the Rend
     */
    public double getRend() {
        return Rend;
    }

    /**
     * @param Rend the Rend to set
     */
    public void setRend(double Rend) {
        this.Rend = Rend;
    }

    /**
     * @return the Gasto
     */
    public double getGasto() {
        return Gasto;
    }

    /**
     * @param Gasto the Gasto to set
     */
    public void setGasto(double Gasto) {
        this.Gasto = Gasto;
    }

    /**
     * @return the Saldo
     */
    public double getSaldo() {
        return Saldo;
    }

    /**
     * @param Saldo the Saldo to set
     */
    public void setSaldo(double Saldo) {
        this.Saldo = Saldo;
    }

    private double Rend;
    private double Gasto;
    private double Saldo;
    private double Meta;
}
