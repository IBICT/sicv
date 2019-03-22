package br.com.ibict.acv.sicv.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DerbyDBInitializingListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        System.out.println("Servlet Content Initialized");

        try {
            System.out.println("Loading Derby DB Driver...");
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            initializeDatabase();
        } catch (ClassNotFoundException e) {
            System.out.println("Could not load Derby Embedded Driver! Exception: " + e.toString());
        } catch (SQLException sqle) {
            System.out.println("Fatal Database Error! Exception: " +  sqle.toString());
        }
    }

    private void initializeDatabase() throws SQLException {
        Connection connection = null;
        try {
            System.out.println("Starting up Derby DB...");
            connection = DriverManager
                    .getConnection("jdbc:derby:olca_mem_db1;create=true");
        } catch (SQLException sqle) {
            System.out.println("Could not connect to Derby Embedded DB! Exception: " +  sqle.toString());
            throw sqle;
        } finally {
            if (connection != null) {
                connection.close();
            }
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) { }
}