/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connectdb;
import java.sql.*;
/**
 *
 * @author smile_000
 */
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

public class MySQLConnect {

    String Host;
    String UserName;
    String PassWord;
    String DataBase;
    Connection connect;
    Statement statement;
    ResultSet result;

    public MySQLConnect(String Host, String UserName, String PassWord, String DataBase) {
        this.DataBase = DataBase;
        this.Host = Host;
        this.PassWord = PassWord;
        this.UserName = UserName;
    }

    protected void driverTest() throws Exception {
        try {
            Class.forName("org.gjt.mm.mysql.Driver");
        } catch (java.lang.ClassNotFoundException e) {
            throw new Exception("Not fund file");

        }
    }

    /**
     *
     * @return @throws Exception
     */
    protected Connection getConnect() throws Exception {

        if (this.connect == null) {
            driverTest();
            String url = "jdbc:mysql://" + this.Host + ":3306/" + this.DataBase;
            try {
                this.connect = DriverManager.getConnection(url, this.UserName, this.PassWord);
            } catch (java.sql.SQLException e) {
                throw new Exception("khong the ket noi");
            }

        }
        return this.connect;
    }

    public Statement getStatement() throws Exception {
        if (this.statement == null ? true : this.statement.isClosed()) {
            this.statement = this.getConnect().createStatement();
        }
        return this.statement;

    }

    public ResultSet excuteQuery(String Query) throws Exception {
        try {
            this.result = getStatement().executeQuery(Query);

        } catch (Exception e) {
            throw new Exception("Erro:" + e.getMessage() + "-" + Query);
        }
        return this.result;

    }

    public int updateQuery(String Query) throws Exception {
        int res = Integer.MIN_VALUE;
        try {
            res = getStatement().executeUpdate(Query);

        } catch (Exception e) {
            throw new Exception("Erro:" + e.getMessage() + "-" + Query);
        } finally {
           this.statement.close();
        }
        return res;
    }

    public void Close() throws Exception {
        if (this.result != null && !this.result.isClosed()) {
            this.result.close();
            this.result = null;
        }
        if (this.statement != null && !this.statement.isClosed()) {
            this.statement.close();
            this.statement = null;
        }
        if (this.connect != null && !this.connect.isClosed()) {
            this.connect.close();
            this.connect = null;
        }
    }

}
