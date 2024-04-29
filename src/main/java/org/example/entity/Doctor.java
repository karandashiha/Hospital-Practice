package org.example.entity;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Doctor {
    private Connection connection;

    public Doctor(Connection connection) {
        this.connection = connection;
    }

    public void viewDoctors() {
        String query = "select * from doctors";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            System.out.println("Doctors: ");
            System.out.println("+------------+-----------------+------------------+-------------------+----------------+");
            System.out.println("| Doctor Id  | First Name      |  Last Name       | Specialization    |  Phone         |");
            System.out.println("+------------+-----------------+------------------+-------------------+----------------+");
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String firstName = resultSet.getString("first_name");
                String lastName = resultSet.getString("last_name");
                String specialization = resultSet.getString("specialization");
                String phone = resultSet.getString("phone");
                System.out.printf("| %-10s | %-15s | %-16s | %-17s | %-14s |\n", id, firstName, lastName, specialization, phone);
                System.out.println("+------------+-----------------+------------------+-------------------+----------------+");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean getDoctorById(int id) {
        String query = "SELECT * FROM doctors WHERE id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
