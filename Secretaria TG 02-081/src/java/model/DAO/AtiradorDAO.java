package model.DAO;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

//Imports

import model.Atirador;
import Configurações.ConectorDB;
import java.sql.*;
import java.util.*;

/**
 *
 * @author felip
 */
public class AtiradorDAO {
    //Método para cadastro de atiradores
    public boolean cadastrar (Atirador atrd) throws ClassNotFoundException{
        Connection conn = null;
        try {
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
             
            //             INSERT INTO Atirador(Nome, RG)
            String sql = "INSERT INTO Atirador (Nome, RG) VALUES ('" + atrd.getNome() + "', '" + atrd.getRG() + "');";
            stmt.executeUpdate(sql);
            conn.close();
        }catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }
        return true;
    }

    
    //Consulta geral da turma de atiradores
    
    public List<Atirador> consultar_geral() throws ClassNotFoundException {
        List<Atirador> lista = new ArrayList<>();
        
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "select * from atirador";
            ResultSet rs =stmt.executeQuery(sql);
            
            int contg = 0;
            while (rs.next()){
                Atirador atrd = new Atirador();
                atrd.setNumero(Integer.parseInt(rs.getString("Numero")));
                atrd.setNome(rs.getString("Nome"));
                atrd.setRG(rs.getString("RG"));
                lista.add(atrd);
                contg++;
            }
            conn.close();
            
            if (contg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return null;
        }
        }
    
    //Método para consulta por nome
    public List<Atirador> consultar_nome (String p_nome) throws ClassNotFoundException{
        List lista = new ArrayList();
        
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "select * from atirador where Nome like '%"+p_nome+"%'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int contg = 0;
            while (rs.next()){
                Atirador atrd = new Atirador();
                atrd.setNumero(Integer.parseInt(rs.getString("Numero")));
                atrd.setNome(rs.getString("Nome"));
                atrd.setRG(rs.getString("RG"));
                lista.add(atrd);
                contg++;
            }
            conn.close();
            
            if (contg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return null;
        }
    }
    
    //método para consultar atirador por número
    public List consultar_numero (String p_numero) throws ClassNotFoundException{
        List lista = new ArrayList();
        
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "select * from atirador where Numero like '%"+p_numero+"%'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int contg = 0;
            while (rs.next()){
                Atirador atrd = new Atirador();
                atrd.setNumero(Integer.parseInt(rs.getString("Numero")));
                atrd.setNome(rs.getString("Nome"));
                atrd.setRG(rs.getString("RG"));
                lista.add(atrd);
                contg++;
            }
            conn.close();
            
            if (contg==0){
                return null;
            }else{
                return lista;
            }
        }catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return null;
        }
    }
    
    //Método para excluir 
    public boolean excluir (Atirador atrd) throws ClassNotFoundException{
        Connection conn= null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "delete from atirador where Numero = " + atrd.getNumero();
            int result = stmt.executeUpdate(sql);
            if (result==0){
                return false;
            }else{
                return true;
            }
        }catch (SQLException ex){
            System.out.println("Erro SQL: "+ ex);
            return false;
        }
    }
    
    //Método para alterar o cadastro de um atirador
    public boolean alterar (Atirador atrd)throws ClassNotFoundException{
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "UPDATE Atirador SET Nome = '"+ atrd.getNome() +"' , RG = '"+ atrd.getRG()+"' WHERE Numero = " + atrd.getNumero();
            stmt.executeUpdate(sql);
            conn.close();
        }catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }
        return true;
    }
}
                
            
            
     


        