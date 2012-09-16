/**
 * ActiveJDBCExample
 *
 * activejdbc use example.
 *
 * @author Ariel Gerardo Rios <mailto:ariel.gerardo.rios@gmail.com>
 *
 */

package org.gabrielle.activejdbcexample;

import java.io.IOException;

import java.net.URL;

import java.util.Properties;

import org.javalite.activejdbc.Base;

/** 
 * activejdbc use example.
 *
 * @author Ariel Gerardo Ríos <mailto:ariel.gerardo.rios@gmail.com>
*/
public class ActiveJDBCExample extends Object { 

    /**
     * Load a <b>Properties</b> file from classpath.
     *
     * @param propsName
     * @return Properties
     * @throws IOException 
     */
    public static Properties loadProperties(String propsName) throws
            IOException {
        Properties props = new Properties();
        URL url = ClassLoader.getSystemResource(propsName);
        props.load(url.openStream());
        return props;
    }

    /** 
     * Main method for use example.
     *
     * @throws IOException 
     *
    */
    public static void main (String [] args) throws IOException {

        // Loading database configuration
        Properties props = loadProperties("database.properties");

        String driver = props.getProperty("database.driver");
        String url = props.getProperty("database.url");
        String username = props.getProperty("database.auth.username");
        String password = props.getProperty("database.auth.password");

        // Opening database connection
        Base.open(driver, url, username, password);

        // Closing database connection
        Base.close();
    }
}

// vim:ft=java:
