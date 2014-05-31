/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;

import connectdb.MySQLConnect;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import path.Dir;

/**
 *
 * @author smile_000
 */
public class CheckLogin {

    private String role;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    private String user;

    public void setUser(String user) {
        this.user = user;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getUser() {
        return user;
    }

    public String getPass() {
        return pass;
    }
    private String pass;

    public CheckLogin() {
    }

    public CheckLogin(String user, String pass) {
        this.user = user;
        this.pass = CreatMd5.ArcMd5(pass);
    }

    public boolean Validate() {

        MySQLConnect connect = new MySQLConnect(Dir.localhost, Dir.user, Dir.pass, Dir.database);
        ResultSet result;
        try {
            result = connect.excuteQuery("select * from account_queue where account='" + user + "' and password='" + pass + "'");
            int num = 0;
            while (result.next()) {
                num = result.getRow();
                if(num!=0){
                    this.role= result.getString("role");
                    return true;
                }
            }
            
        } catch (Exception ex) {
            Logger.getLogger(CheckLogin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

//    public static void main(String[] args) {
//        CheckLogin obj = new CheckLogin("tony", "5acdc9ca5d99ae66afdfe1eea0e3b26b");
//        if (obj.Validate()) {
//            System.out.println(obj.role);
//        }
//    }
}
