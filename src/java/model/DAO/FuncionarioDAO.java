/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.DAO;
import Configurações.ConectorDB;
import java.sql.*;
import java.util.*;
import model.Funcionario;
   

/**
 *
 * @author felip
 */
public class FuncionarioDAO {
    //método para cadastrar funcionários
   public boolean cadastrar (Funcionario func) throws ClassNotFoundException{
       Connection conn = null;
       try{
           conn = ConectorDB.conectar();
           Statement stmt = conn.createStatement();
           
           String sql = "INSERT INTO Funcionario (Nome, Cargo, RG) VALUES ('" + func.getNome() + "', '"+ func.getCargo()+"' ,' " + func.getRG() + "');";
            stmt.executeUpdate(sql);
            conn.close();
        }catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }
        return true;
    }
    public List<Funcionario> consultar_geral() throws ClassNotFoundException {
        List<Funcionario> lista = new ArrayList<>();
        
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "select * from funcionario";
            ResultSet rs =stmt.executeQuery(sql);
            
            int contg = 0;
            while (rs.next()){
                Funcionario func = new Funcionario();
                func.setNumero(Integer.parseInt(rs.getString("Numero")));
                func.setNome(rs.getString("Nome"));
                func.setCargo(rs.getString("cargo"));
                func.setRG(rs.getString("RG"));
                lista.add(func);
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
        
    public List<Funcionario> consultar_nome (String p_nome) throws ClassNotFoundException{
        List lista = new ArrayList();
        
        Connection conn = null;
        try{
            conn = ConectorDB.conectar();
            Statement stmt = conn.createStatement();
            String sql = "select * from Funcionario where Nome like '%"+p_nome+"%'";
            ResultSet rs = stmt.executeQuery(sql);
            
            int contg = 0;
            while (rs.next()){
                Funcionario func = new Funcionario();
                func.setNumero(Integer.parseInt(rs.getString("Numero")));
                func.setNome(rs.getString("Nome"));
                func.setCargo(rs.getString("Cargo"));
                func.setRG(rs.getString("RG"));
                lista.add(func);
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
    public boolean excluir(Funcionario func) throws ClassNotFoundException {
    Connection conn = null;
    try {
        conn = ConectorDB.conectar();
        Statement stmt = conn.createStatement();
        
        // CORREÇÃO AQUI: Adicionar aspas simples ' antes e depois do nome
        String sql = "delete from funcionario where Nome = '" + func.getNome() + "'";
        
        int result = stmt.executeUpdate(sql);
        
        if (result == 0) {
            return false; // Ninguém foi apagado (nome não encontrado)
        } else {
            return true;  // Sucesso
        }
        
    } catch (SQLException ex) {
        System.out.println("Erro SQL: " + ex);
        return false;
    } 
   
    }
    public boolean alterar(Funcionario func) throws ClassNotFoundException {
    Connection conn = null;
    try {
        conn = ConectorDB.conectar();
        Statement stmt = conn.createStatement();
        
        // CORREÇÃO 1: Adicionei "Funcionario" após UPDATE
        // CORREÇÃO 2: Mudei o WHERE para usar o Numero (ID)
        String sql = "UPDATE Funcionario SET Nome = '" + func.getNome() + "', "
                   + "Cargo = '" + func.getCargo() + "', "
                   + "RG = '" + func.getRG() + "' "
                   + "WHERE Numero = " + func.getNumero(); 

        // Esta linha mostra no console o comando exato que está indo para o banco (bom para testes)
        System.out.println("SQL Gerado: " + sql);

        int result = stmt.executeUpdate(sql);
        
        conn.close();
        
        // Se result for maior que 0, funcionou.
        return result > 0;

    } catch (SQLException ex) {
        System.out.println("Erro SQL: " + ex);
        return false;
    }
    }
}
    

    
    

