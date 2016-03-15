package Model;
// Generated Mar 15, 2016 8:50:47 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Department generated by hbm2java
 */
public class Department  implements java.io.Serializable {


     private Integer departmentId;
     private int departmentName;
     private int departmentManagerId;
     private Set goals = new HashSet(0);
     private Set jobs = new HashSet(0);

    public Department() {
    }

	
    public Department(int departmentName, int departmentManagerId) {
        this.departmentName = departmentName;
        this.departmentManagerId = departmentManagerId;
    }
    public Department(int departmentName, int departmentManagerId, Set goals, Set jobs) {
       this.departmentName = departmentName;
       this.departmentManagerId = departmentManagerId;
       this.goals = goals;
       this.jobs = jobs;
    }
   
    public Integer getDepartmentId() {
        return this.departmentId;
    }
    
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }
    public int getDepartmentName() {
        return this.departmentName;
    }
    
    public void setDepartmentName(int departmentName) {
        this.departmentName = departmentName;
    }
    public int getDepartmentManagerId() {
        return this.departmentManagerId;
    }
    
    public void setDepartmentManagerId(int departmentManagerId) {
        this.departmentManagerId = departmentManagerId;
    }
    public Set getGoals() {
        return this.goals;
    }
    
    public void setGoals(Set goals) {
        this.goals = goals;
    }
    public Set getJobs() {
        return this.jobs;
    }
    
    public void setJobs(Set jobs) {
        this.jobs = jobs;
    }




}

