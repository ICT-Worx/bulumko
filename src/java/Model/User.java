package Model;
// Generated Mar 15, 2016 8:50:47 AM by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * User generated by hbm2java
 */
public class User  implements java.io.Serializable {


     private Integer userId;
     private String username;
     private String email;
     private String password;
     private Date createTime;
     private int employeeEmployeeId;

    public User() {
    }

	
    public User(String username, String email, String password, int employeeEmployeeId) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.employeeEmployeeId = employeeEmployeeId;
    }
    public User(String username, String email, String password, Date createTime, int employeeEmployeeId) {
       this.username = username;
       this.email = email;
       this.password = password;
       this.createTime = createTime;
       this.employeeEmployeeId = employeeEmployeeId;
    }
   
    public Integer getUserId() {
        return this.userId;
    }
    
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    public Date getCreateTime() {
        return this.createTime;
    }
    
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    public int getEmployeeEmployeeId() {
        return this.employeeEmployeeId;
    }
    
    public void setEmployeeEmployeeId(int employeeEmployeeId) {
        this.employeeEmployeeId = employeeEmployeeId;
    }




}


