// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.data.autaut;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import nl.bzk.brp.model.data.autaut.HisAuthenticatiemiddel;

privileged aspect HisAuthenticatiemiddel_Roo_Jpa_Entity {
    
    declare @type: HisAuthenticatiemiddel: @Entity;
    
    declare @type: HisAuthenticatiemiddel: @Table(schema = "autaut", name = "his_authenticatiemiddel");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", columnDefinition = "serial")
    private Integer HisAuthenticatiemiddel.id;
    
    public Integer HisAuthenticatiemiddel.getId() {
        return this.id;
    }
    
    public void HisAuthenticatiemiddel.setId(Integer id) {
        this.id = id;
    }
    
}
