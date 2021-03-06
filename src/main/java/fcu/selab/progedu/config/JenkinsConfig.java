package fcu.selab.progedu.config;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import fcu.selab.progedu.exception.LoadConfigFailureException;

public class JenkinsConfig {
  private static final String PROPERTY_FILE = "/config/jenkins_config.properties";
  
  private static JenkinsConfig INSTANCE = new JenkinsConfig();
  
  public static JenkinsConfig getInstance() {
    return INSTANCE;
  }
  
  private Properties props;
  
  private JenkinsConfig() {
    InputStream is = this.getClass().getResourceAsStream(PROPERTY_FILE);
    try {
      props = new Properties();
      props.load(is);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
  
  /**
   * Get jenkins host url
   * @return url
   * @throws LoadConfigFailureException on properties call error
   */
  public String getJenkinsHostUrl() throws LoadConfigFailureException {
    if (props != null) {
      return props.getProperty("JENKINS_HOST_URL");
    }
    throw new LoadConfigFailureException(
        "Unable to get config of JENKINS connection string from file;" + PROPERTY_FILE);
  }
  
  /**
   * Get jenkins root username
   * @return username
   * @throws LoadConfigFailureException on properties call error
   */
  public String getJenkinsRootUsername() throws LoadConfigFailureException {
    if (props != null) {
      return props.getProperty("JENKINS_ROOT_USERNAME");
    }
    throw new LoadConfigFailureException(
      "Unable to get config of JENKINS connection string from file;" + PROPERTY_FILE);
  }
  
  /**
   * Get jenkins root password
   * @return password
   * @throws LoadConfigFailureException on properties call error
   */
  public String getJenkinsRootPassword() throws LoadConfigFailureException {
    if (props != null) {
      return props.getProperty("JENKINS_ROOT_PASSWORD");
    }
    throw new LoadConfigFailureException(
      "Unable to get config of JENKINS connection string from file;" + PROPERTY_FILE);
  }
  
  /**
   * Get jenkins api token
   * @return token
   * @throws LoadConfigFailureException on properties call error
   */
  public String getJenkinsApiToken() throws LoadConfigFailureException {
    if (props != null) {
      return props.getProperty("JENKINS_API_TOKEN");
    }
    throw new LoadConfigFailureException(
      "Unable to get config of JENKINS connection string from file;" + PROPERTY_FILE);
  }
  
  /**
   * Get jenkins root url
   * @return url
   * @throws LoadConfigFailureException on properties call error
   */
  public String getJenkinsRootUrl() throws LoadConfigFailureException {
    if (props != null) {
      return props.getProperty("JENKINS_ROOT_URL");
    }
    throw new LoadConfigFailureException(
      "Unable to get config of JENKINS connection string from file;" + PROPERTY_FILE);
  }
}
