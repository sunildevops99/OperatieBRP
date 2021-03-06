/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.testdatageneratie.domain.kern;
// Generated 5-feb-2013 16:30:05 by Hibernate Tools 3.2.4.GA



/**
 * Persreisdoc generated by hbm2java
 */
public class Persreisdoc  implements java.io.Serializable {


     private Integer id;
     private Pers pers;
     private Rdnvervallenreisdoc rdnvervallenreisdoc;
     private Autvanafgiftereisdoc autvanafgiftereisdoc;
     private Srtnlreisdoc srtnlreisdoc;
     private String nr;
     private Short lengtehouder;
     private Integer datingangdoc;
     private Integer datuitgifte;
     private Integer datvoorzeeindegel;
     private Integer datinhingvermissing;
     private String persreisdocstatushis = StatusHis.A.name();

    public Persreisdoc() {
    }


    public Persreisdoc(Pers pers, Srtnlreisdoc srtnlreisdoc, String persreisdocstatushis) {
        this.pers = pers;
        this.srtnlreisdoc = srtnlreisdoc;
        this.persreisdocstatushis = persreisdocstatushis;
    }
    public Persreisdoc(Pers pers, Rdnvervallenreisdoc rdnvervallenreisdoc, Autvanafgiftereisdoc autvanafgiftereisdoc, Srtnlreisdoc srtnlreisdoc, String nr, Short lengtehouder, Integer datingangdoc, Integer datuitgifte, Integer datvoorzeeindegel, Integer datinhingvermissing, String persreisdocstatushis) {
       this.pers = pers;
       this.rdnvervallenreisdoc = rdnvervallenreisdoc;
       this.autvanafgiftereisdoc = autvanafgiftereisdoc;
       this.srtnlreisdoc = srtnlreisdoc;
       this.nr = nr;
       this.lengtehouder = lengtehouder;
       this.datingangdoc = datingangdoc;
       this.datuitgifte = datuitgifte;
       this.datvoorzeeindegel = datvoorzeeindegel;
       this.datinhingvermissing = datinhingvermissing;
       this.persreisdocstatushis = persreisdocstatushis;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    public Pers getPers() {
        return this.pers;
    }

    public void setPers(Pers pers) {
        this.pers = pers;
    }
    public Rdnvervallenreisdoc getRdnvervallenreisdoc() {
        return this.rdnvervallenreisdoc;
    }

    public void setRdnvervallenreisdoc(Rdnvervallenreisdoc rdnvervallenreisdoc) {
        this.rdnvervallenreisdoc = rdnvervallenreisdoc;
    }
    public Autvanafgiftereisdoc getAutvanafgiftereisdoc() {
        return this.autvanafgiftereisdoc;
    }

    public void setAutvanafgiftereisdoc(Autvanafgiftereisdoc autvanafgiftereisdoc) {
        this.autvanafgiftereisdoc = autvanafgiftereisdoc;
    }
    public Srtnlreisdoc getSrtnlreisdoc() {
        return this.srtnlreisdoc;
    }

    public void setSrtnlreisdoc(Srtnlreisdoc srtnlreisdoc) {
        this.srtnlreisdoc = srtnlreisdoc;
    }
    public String getNr() {
        return this.nr;
    }

    public void setNr(String nr) {
        this.nr = nr;
    }
    public Short getLengtehouder() {
        return this.lengtehouder;
    }

    public void setLengtehouder(Short lengtehouder) {
        this.lengtehouder = lengtehouder;
    }
    public Integer getDatingangdoc() {
        return this.datingangdoc;
    }

    public void setDatingangdoc(Integer datingangdoc) {
        this.datingangdoc = datingangdoc;
    }
    public Integer getDatuitgifte() {
        return this.datuitgifte;
    }

    public void setDatuitgifte(Integer datuitgifte) {
        this.datuitgifte = datuitgifte;
    }
    public Integer getDatvoorzeeindegel() {
        return this.datvoorzeeindegel;
    }

    public void setDatvoorzeeindegel(Integer datvoorzeeindegel) {
        this.datvoorzeeindegel = datvoorzeeindegel;
    }
    public Integer getDatinhingvermissing() {
        return this.datinhingvermissing;
    }

    public void setDatinhingvermissing(Integer datinhingvermissing) {
        this.datinhingvermissing = datinhingvermissing;
    }
    public String getPersreisdocstatushis() {
        return this.persreisdocstatushis;
    }

    public void setPersreisdocstatushis(String persreisdocstatushis) {
        this.persreisdocstatushis = persreisdocstatushis;
    }




}


