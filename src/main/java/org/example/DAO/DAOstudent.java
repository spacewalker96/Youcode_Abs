package org.example.DAO;

import org.example.modele.Student;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public interface DAOstudent {
    public List<Student> getAll() throws ClassNotFoundException, SQLException;

    public Student getById(Long id) throws ClassNotFoundException, SQLException;

    public Student ajoutStudent(String nom, String prenom) throws ClassNotFoundException, SQLException;

    public int updateStudent(Long id, String nom, String prenom) throws ClassNotFoundException, SQLException;

    public int deleteById(Long id);

}
