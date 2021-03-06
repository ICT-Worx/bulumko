package Model;
// Generated Mar 15, 2016 8:50:47 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Job generated by hbm2java
 */
public class Job  implements java.io.Serializable {


     private Integer jobId;
     private Department department;
     private String jobTitle;
     private String jobDescr;
     private Set employees = new HashSet(0);

    public Job() {
    }

	
    public Job(String jobTitle, String jobDescr) {
        this.jobTitle = jobTitle;
        this.jobDescr = jobDescr;
    }
    public Job(Department department, String jobTitle, String jobDescr, Set employees) {
       this.department = department;
       this.jobTitle = jobTitle;
       this.jobDescr = jobDescr;
       this.employees = employees;
    }
   
    public Integer getJobId() {
        return this.jobId;
    }
    
    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }
    public Department getDepartment() {
        return this.department;
    }
    
    public void setDepartment(Department department) {
        this.department = department;
    }
    public String getJobTitle() {
        return this.jobTitle;
    }
    
    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }
    public String getJobDescr() {
        return this.jobDescr;
    }
    
    public void setJobDescr(String jobDescr) {
        this.jobDescr = jobDescr;
    }
    public Set getEmployees() {
        return this.employees;
    }
    
    public void setEmployees(Set employees) {
        this.employees = employees;
    }




}


