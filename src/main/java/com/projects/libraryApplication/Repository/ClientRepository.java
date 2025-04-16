package com.projects.libraryApplication.Repository;


import com.projects.libraryApplication.Model.Client;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.List;

@Repository
public class ClientRepository implements GenericRepository<Client, Integer> {

    private Connection getConnection(){
        return DBConnection.getInstance().getConnection();
    }

    @Override
    public void save(Client client){
        String sql="INSERT INTO clients (email, password, nationalId, firstName, lastName, birthDate) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = getConnection().prepareStatement(sql)){
            pstmt.setString(1, client.getEmail());
            pstmt.setString(2, client.getPassword());
            pstmt.setString(3, client.getNationalId());
            pstmt.setString(4, client.getFirstName());
            pstmt.setString(5, client.getLastName());
            pstmt.setDate(6, java.sql.Date.valueOf(client.getBirthDate()));
            pstmt.executeUpdate();
            System.out.println("El cliente se ha registrado correctamente.");

        } catch (SQLException e) {
            System.err.println("Error al guardar el cliente.");
            e.printStackTrace();
        }
    }

    @Override
    public void updateAll(Client client){
        String sql="UPDATE client SET email=?, password=?, nationalId=?, firstName=?, lastName=?, birthDate=?";
        try(PreparedStatement pstmt = getConnection().prepareStatement(sql)){
            pstmt.setString(1, client.getEmail());
            pstmt.setString(2, client.getPassword());
            pstmt.setString(3, client.getNationalId());
            pstmt.setString(4, client.getFirstName());
            pstmt.setString(5, client.getLastName());
            pstmt.setDate(6, java.sql.Date.valueOf(client.getBirthDate()));
            pstmt.executeUpdate();
            System.out.println("Los datos se han actualizado correctamente.");

        }catch(SQLException e){
            System.err.println("Error al actualizar los datos.");
            e.printStackTrace();
        }
    }

    public void updateGeneralData(Client client){
        String sql="UPDATE client SET email=?, firstName=?, lastName=? WHERE id=?";
        try(PreparedStatement pstmt = getConnection().prepareStatement(sql)){
            pstmt.setString(1, client.getFirstName());
            pstmt.setString(2, client.getLastName());
            pstmt.setString(3, client.getEmail());
            pstmt.setInt(4, client.getId());
            pstmt.executeUpdate();
            System.out.println("Los datos se han actualizado correctamente.");
        }catch(SQLException e){
            System.err.println("Error al actualizar los datos.");
            e.printStackTrace();
        }
    }

    public void updatePassword(Client client){
        String sql="UPDATE client SET password=? where id=?";
        try(PreparedStatement pstmt = getConnection().prepareStatement(sql)){
            pstmt.setString(1, client.getPassword());
            pstmt.setInt(2, client.getId());
            pstmt.executeUpdate();
            System.out.println("La contraseña se ha actualizado correctamente.");
        }catch(SQLException e){
            System.err.println("Error al actualizar la contraseña.");
            e.printStackTrace();
        }
    }

    @Override
    public void delete(Integer id){
        String sql="DELETE FROM client WHERE id=?";
        try(PreparedStatement pstmt = getConnection().prepareStatement(sql)){
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        }catch(SQLException e){
            System.err.println("Error al actualizar la contraseña.");
            e.printStackTrace();
        }
    }

    @Override
    public void getById(Integer id){
        String sql="SELECT * FROM client where id=?";
        Client client=null;
        try(PreparedStatement pstmt=getConnection().prepareStatement(sql)){
            pstmt.setInt(1,id);
            try (ResultSet rs= pstmt.executeQuery()){
                if(rs.next()){
                    client = mapClient(rs);
                }
            }
        } catch(SQLException e) {
            System.out.println("Error al obtener al alumno por id.");
            e.printStackTrace();
        }
    }

    @Override
    public List<Client> listAll(){
        String sql = "SELECT * FROM alumnos";
    }

    public Client mapClient(ResultSet rs) throws SQLException {
        Client client = new Client;
        client.setId(rs.getInt("id"));
        client.setEmail(rs.getString("email"));
        client.setPassword(rs.getString("password"));
        client.setNationalId(rs.getString("nationalId"));
        client.setFirstName(rs.getString("firstName"));
        client.setLastName(rs.getString("lastName"));
        java.sql.Date sqlDate = rs.getDate("birthDate");
        client.setBirthDate(sqlDate.toLocalDate());
        return client;
    }


}
