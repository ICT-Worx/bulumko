package Model;
// Generated Mar 15, 2016 8:50:47 AM by Hibernate Tools 4.3.1



/**
 * Manager generated by hbm2java
 */
public class Manager  implements java.io.Serializable {


     private Integer managerId;
     private Employee employee;

    public Manager() {
    }

    public Manager(Employee employee) {
       this.employee = employee;
    }
   
    public Integer getManagerId() {
        return this.managerId;
    }
    
    public void setManagerId(Integer managerId) {
        this.managerId = managerId;
    }
    public Employee getEmployee() {
        return this.employee;
    }
    
    public void setEmployee(Employee employee) {
        this.employee = employee;
    }




}


