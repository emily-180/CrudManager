package model.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.Dependente;
import model.ModelException;
import model.Seller;
import model.User;

public class MySQLDependenteDAO implements DependenteDAO {

	@Override
	public boolean save(Dependente dependente) throws ModelException {
		DBHandler db = new DBHandler();
		
		String sqlInsert = "INSERT INTO dependentes VALUES (DEFAULT, ?, ?, ?, ?, ?);";
		
		db.prepareStatement(sqlInsert);
		
		db.setString(1, dependente.getNome());
		db.setString(2, dependente.getParentesco());
		db.setDate(3, dependente.getDataNasc() == null ? new Date() : dependente.getDataNasc());
		db.setString(4, dependente.getInfoSaude());
		db.setInt(5, dependente.getSeller().getId());
		
		return db.executeUpdate() > 0;	
	}

	@Override
	public boolean update(Dependente dependente) throws ModelException {
		DBHandler db = new DBHandler();
		
		String sqlUpdate = "UPDATE dependentes "
				+ " SET nome = ?, "
				+ " parentesco = ?, "
				+ " dataNasc = ?, "
				+ " infoSaude = ?, "
				+ " seller_id = ? "
				+ " WHERE id = ?; "; 
		
		db.prepareStatement(sqlUpdate);
		
		db.setString(1, dependente.getNome());
		db.setString(2, dependente.getParentesco());		
		db.setDate(3, dependente.getDataNasc() == null ? new Date() : dependente.getDataNasc());		
		db.setString(4, dependente.getInfoSaude());		
		db.setInt(5, dependente.getSeller().getId());
		db.setInt(6, dependente.getId());
		
		return db.executeUpdate() > 0;
	}

	@Override
	public boolean delete(Dependente dependente) throws ModelException {
		DBHandler db = new DBHandler();
		
		String sqlDelete = " DELETE FROM dependentes "
		         + " WHERE id = ?;";

		db.prepareStatement(sqlDelete);		
		db.setInt(1, dependente.getId());
		
		return db.executeUpdate() > 0;
	}

	@Override
	public List<Dependente> listAll() throws ModelException {
		DBHandler db = new DBHandler();
		
		List<Dependente> dependentes = new ArrayList<Dependente>();
			
		// Declara uma instrução SQL
		String sqlQuery = " SELECT c.id as 'dependente_id', c.nome as 'dependente_nome', c.parentesco, c.dataNasc, c.infoSaude, s.id as 'seller_id', s.name as 'seller_nome' FROM dependentes c INNER JOIN sellers s ON c.seller_id = s.id;";
		
		db.createStatement();
	
		db.executeQuery(sqlQuery);

		while (db.next()) {
			Seller seller = new Seller(db.getInt("seller_id"));
		    seller.setName(db.getString("seller_nome")); 

		  
		    Dependente dependente = new Dependente(db.getInt("dependente_id"));
		    dependente.setNome(db.getString("dependente_nome"));
		    dependente.setParentesco(db.getString("parentesco"));
		    dependente.setDataNasc(db.getDate("dataNasc"));
		    dependente.setInfoSaude(db.getString("infoSaude"));
		    dependente.setSeller(seller); 
			
			dependentes.add(dependente);
		

		}
		
		return dependentes;
	}

	@Override
	public Dependente findById(int id) throws ModelException {
		DBHandler db = new DBHandler();
		
		String sql = "SELECT * FROM dependentes WHERE id = ?;";
		
		db.prepareStatement(sql);
		db.setInt(1, id);
		db.executeQuery();
		
		Dependente c = null;
		while (db.next()) {
			c = new Dependente(id);
			c.setNome(db.getString("nome"));
			c.setParentesco(db.getString("parentesco"));
			c.setDataNasc(db.getDate("dataNasc"));
			c.setInfoSaude(db.getString("infoSaude"));
			
			SellerDAO sellerDAO = DAOFactory.createDAO(SellerDAO.class); 
			Seller seller = sellerDAO.findById(db.getInt("seller_id"));
			c.setSeller(seller);
			
			break;
		}
		
		return c;
	}
}
