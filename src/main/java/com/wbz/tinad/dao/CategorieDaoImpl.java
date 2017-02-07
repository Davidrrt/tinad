package com.wbz.tinad.dao;

import com.wbz.tinad.beans.Categorie;
import static com.wbz.tinad.dao.DAOUtilitaire.fermeturesSilencieuses;
import static com.wbz.tinad.dao.DAOUtilitaire.initialisationRequetePreparee;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategorieDaoImpl implements CategorieDao {

    private DAOFactory daoFactory;

    private static final String SQL_SELECT_ALL_CATEGORIE_UI = "SELECT * FROM CATEGORIE";

    CategorieDaoImpl(DAOFactory daoFactory) {
        this.daoFactory = daoFactory;
    }

    public Categorie[] getAllCategorie() throws DAOException {
        Connection connexion = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        List<Categorie> tab = new ArrayList<Categorie>();
        try {
            connexion = daoFactory.getConnection();
            preparedStatement = initialisationRequetePreparee(connexion, SQL_SELECT_ALL_CATEGORIE_UI, false);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                tab.add(map(resultSet));
            }
            Categorie[] categorie = new Categorie[tab.size()];
            for (int i = 0; i < tab.size(); i++) {
                categorie[i] = tab.get(i);
            }
            return categorie;
        } catch (SQLException e) {
            throw new DAOException(e.getMessage());
        } finally {
            fermeturesSilencieuses(resultSet, preparedStatement, connexion);
        }
    }

    private static Categorie map(ResultSet resultSet) throws SQLException {
        Categorie categorie = new Categorie();
        categorie.setIdCategorie(resultSet.getInt("idcategorie"));
        categorie.setCategorie(resultSet.getString("designation"));
        return categorie;
    }
}
