package model;

import java.util.Date;

public class Dependente {
	private int id;
	private String nome;
	private String parentesco;
	private Date dataNasc;
	private String infoSaude;
	private Seller seller;
	
	public Dependente() {}
	
	public Dependente(int id) {
		this.id = id;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getParentesco() {
		return parentesco;
	}
	public void setParentesco(String parentesco) {
		this.parentesco = parentesco;
	}
	public Date getDataNasc() {
		return dataNasc;
	}
	public void setDataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}
	public String getInfoSaude() {
		return infoSaude;
	}
	public void setInfoSaude(String infoSaude) {
		this.infoSaude = infoSaude;
	}
	public Seller getSeller() {
		return seller;
	}
	public void setSeller(Seller seller) {
		this.seller = seller;
	}
	public int getId() {
		return id;
	}
}
