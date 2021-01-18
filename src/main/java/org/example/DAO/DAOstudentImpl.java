package org.example.DAO;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.example.modele.Student;
import org.example.utilities.DBconnection;


public  class DAOstudentImpl  implements DAOstudent {
    Statement statement = null;
    private DBconnection Connexion;

    @Override
    public List<Student> getAll() throws ClassNotFoundException, SQLException {

        List<Student> students = new ArrayList<Student>();
        statement = Connexion.getMyConnexion().createStatement();

        ResultSet rs;
        String query = "Select * From Personne";

        rs = statement.executeQuery(query);

        while (rs.next()) {
            Long id = rs.getLong("student_id");
            String nom = rs.getString("student_firstname");
            String prenom = rs.getString("student_lastname");
            String email = rs.getString("student_email");
            String password = rs.getString("student_password");
            String specialite = rs.getString("student_specialite");
            String anneScolaire = rs.getString("student_annescolaire");
            String role = rs.getString("student_role");

            // Créer l'objet STUDENT
            Student p = new Student(id, nom, prenom,email,password,specialite,anneScolaire,role);
            students.add(p);
        }
        return  students;
    }

    @Override
    public Student getById(Long id) throws ClassNotFoundException, SQLException {
        return null;
    }

    @Override
    public Student ajoutStudent(String nom, String prenom) throws ClassNotFoundException, SQLException {
        return null;
    }

    @Override
    public int updateStudent(Long id, String nom, String prenom) throws ClassNotFoundException, SQLException {
        return 0;
    }

    @Override
    public int deleteById(Long id) {
        return 0;
    }
}
