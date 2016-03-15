package Model;
// Generated Mar 15, 2016 8:50:47 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Audits generated by hbm2java
 */
public class Audits  implements java.io.Serializable {


     private Integer auditsId;
     private Auditor auditor;
     private Set suppliers = new HashSet(0);

    public Audits() {
    }

	
    public Audits(Auditor auditor) {
        this.auditor = auditor;
    }
    public Audits(Auditor auditor, Set suppliers) {
       this.auditor = auditor;
       this.suppliers = suppliers;
    }
   
    public Integer getAuditsId() {
        return this.auditsId;
    }
    
    public void setAuditsId(Integer auditsId) {
        this.auditsId = auditsId;
    }
    public Auditor getAuditor() {
        return this.auditor;
    }
    
    public void setAuditor(Auditor auditor) {
        this.auditor = auditor;
    }
    public Set getSuppliers() {
        return this.suppliers;
    }
    
    public void setSuppliers(Set suppliers) {
        this.suppliers = suppliers;
    }




}

