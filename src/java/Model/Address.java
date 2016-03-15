package Model;
// Generated Mar 15, 2016 8:50:47 AM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Address generated by hbm2java
 */
public class Address  implements java.io.Serializable {


     private Integer addressId;
     private String addressStreetNumber;
     private String addressStreetName;
     private String addressSurbarb;
     private String addressCity;
     private String addressProvince;
     private String addressCountry;
     private Set authors = new HashSet(0);
     private Set customers = new HashSet(0);
     private Set auditors = new HashSet(0);
     private Set employees = new HashSet(0);

    public Address() {
    }

	
    public Address(String addressStreetNumber, String addressStreetName, String addressSurbarb, String addressCity, String addressProvince, String addressCountry) {
        this.addressStreetNumber = addressStreetNumber;
        this.addressStreetName = addressStreetName;
        this.addressSurbarb = addressSurbarb;
        this.addressCity = addressCity;
        this.addressProvince = addressProvince;
        this.addressCountry = addressCountry;
    }
    public Address(String addressStreetNumber, String addressStreetName, String addressSurbarb, String addressCity, String addressProvince, String addressCountry, Set authors, Set customers, Set auditors, Set employees) {
       this.addressStreetNumber = addressStreetNumber;
       this.addressStreetName = addressStreetName;
       this.addressSurbarb = addressSurbarb;
       this.addressCity = addressCity;
       this.addressProvince = addressProvince;
       this.addressCountry = addressCountry;
       this.authors = authors;
       this.customers = customers;
       this.auditors = auditors;
       this.employees = employees;
    }
   
    public Integer getAddressId() {
        return this.addressId;
    }
    
    public void setAddressId(Integer addressId) {
        this.addressId = addressId;
    }
    public String getAddressStreetNumber() {
        return this.addressStreetNumber;
    }
    
    public void setAddressStreetNumber(String addressStreetNumber) {
        this.addressStreetNumber = addressStreetNumber;
    }
    public String getAddressStreetName() {
        return this.addressStreetName;
    }
    
    public void setAddressStreetName(String addressStreetName) {
        this.addressStreetName = addressStreetName;
    }
    public String getAddressSurbarb() {
        return this.addressSurbarb;
    }
    
    public void setAddressSurbarb(String addressSurbarb) {
        this.addressSurbarb = addressSurbarb;
    }
    public String getAddressCity() {
        return this.addressCity;
    }
    
    public void setAddressCity(String addressCity) {
        this.addressCity = addressCity;
    }
    public String getAddressProvince() {
        return this.addressProvince;
    }
    
    public void setAddressProvince(String addressProvince) {
        this.addressProvince = addressProvince;
    }
    public String getAddressCountry() {
        return this.addressCountry;
    }
    
    public void setAddressCountry(String addressCountry) {
        this.addressCountry = addressCountry;
    }
    public Set getAuthors() {
        return this.authors;
    }
    
    public void setAuthors(Set authors) {
        this.authors = authors;
    }
    public Set getCustomers() {
        return this.customers;
    }
    
    public void setCustomers(Set customers) {
        this.customers = customers;
    }
    public Set getAuditors() {
        return this.auditors;
    }
    
    public void setAuditors(Set auditors) {
        this.auditors = auditors;
    }
    public Set getEmployees() {
        return this.employees;
    }
    
    public void setEmployees(Set employees) {
        this.employees = employees;
    }




}

