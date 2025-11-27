/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DAO;
import model.Motivo;
import Configurações.ConectorDB;
import java.sql.*;
import java.util.*;
/**
 *
 * @author felip
 */
public class MotivoDAO {
    public boolean cadastrar (Motivo mtv) throws ClassNotFoundException{
        Connection conn = null;
        try {
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
             
            //             INSERT INTO Atirador(Nome, RG)
            String sql = "INSERT INTO Motivo (Motivo) VALUES ('" + mtv.getMotivo() + "');";
            stmt.executeUpdate(sql);
            conn.close();
        }catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }
        return true;
    }
    
    public List<Motivo> consultar_geral() throws ClassNotFoundException {
        List<Motivo> lista = new ArrayList<>();
        
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "select * from Motivo";
            ResultSet rs =stmt.executeQuery(sql);
            
            int contg = 0;
            while (rs.next()){
                Motivo mtv = new Motivo();
                mtv.setNumero(Integer.parseInt(rs.getString("Numero")));
                mtv.setMotivo(rs.getString("Motivo"));
                
                lista.add(mtv);
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
    public List consultar_numero (String p_numero) throws ClassNotFoundException{
        List lista = new ArrayList();
        
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "select * from Motivo where Numero like '%"+p_numero+"%'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int contg = 0;
            while (rs.next()){
                Motivo mtv = new Motivo();
                mtv.setNumero(Integer.parseInt(rs.getString("Numero")));
                mtv.setMotivo(rs.getString("Motivo"));
                
                lista.add(mtv);
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
    
    public boolean alterar (Motivo mtv)throws ClassNotFoundException{
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "UPDATE Motivo SET Motivo = '"+ mtv.getMotivo() +"' WHERE Numero = " + mtv.getNumero();
            stmt.executeUpdate(sql);
            conn.close();
        }catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }
        return true;
    }
     //Método para excluir 
    public boolean excluir (Motivo mtv) throws ClassNotFoundException{
        Connection conn= null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "delete from Motivo where Numero = " + mtv.getNumero();
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
}
