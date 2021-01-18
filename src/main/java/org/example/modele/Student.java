package org.example.modele;

public class Student {
    private static Long id;
    private static String first_name;
    private static String last_name;
    private static String speciality;
    private static String email;
    private  static  String password;
    private static String annesScolaire;
    private  static  int presence;
    private static  int absence;
    private static String role;
    //Constructor
    public Student() {
    }
    public Student(Long id,String first_name,String last_name,String email,String password,String speciality,String annesScolaire,String role){
        this.id=id;
        this.first_name=first_name;
        this.last_name=last_name;
        this.email=email;
        this.password=password;
        this.speciality=speciality;
        this.annesScolaire=annesScolaire;
        this.role=role;
    }

    //Getters && Setters
    public static Long getId() {
        return id;
    }

    public static void setId(Long id) {
        Student.id = id;
    }

    public static String getFirst_name() {
        return first_name;
    }

    public static void setFirst_name(String first_name) {
        Student.first_name = first_name;
    }

    public static String getLast_name() {
        return last_name;
    }

    public static void setLast_name(String last_name) {
        Student.last_name = last_name;
    }

    public static String getSpeciality() {
        return speciality;
    }

    public static void setSpeciality(String speciality) {
        Student.speciality = speciality;
    }

    public static String getEmail() {
        return email;
    }

    public static void setEmail(String email) {
        Student.email = email;
    }

    public static String getPassword() {
        return password;
    }

    public static void setPassword(String password) {
        Student.password = password;
    }

    public static String getAnnesScolaire() {
        return annesScolaire;
    }

    public static void setAnnesScolaire(String annesScolaire) {
        Student.annesScolaire = annesScolaire;
    }

    public static int getPresence() {
        return presence;
    }

    public static void setPresence(int presence) {
        Student.presence = presence;
    }

    public static int getAbsence() {
        return absence;
    }

    public static void setAbsence(int absence) {
        Student.absence = absence;
    }

    public static String getRole() {
        return role;
    }

    public static void setRole(String role) {
        Student.role = role;
    }
}
