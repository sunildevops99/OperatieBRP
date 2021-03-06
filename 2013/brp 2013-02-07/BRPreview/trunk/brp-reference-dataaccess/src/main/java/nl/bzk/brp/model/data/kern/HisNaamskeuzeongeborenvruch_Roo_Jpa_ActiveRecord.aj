// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.data.kern;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import nl.bzk.brp.model.data.kern.HisNaamskeuzeongeborenvruch;
import org.springframework.transaction.annotation.Transactional;

privileged aspect HisNaamskeuzeongeborenvruch_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager HisNaamskeuzeongeborenvruch.entityManager;
    
    public static final EntityManager HisNaamskeuzeongeborenvruch.entityManager() {
        EntityManager em = new HisNaamskeuzeongeborenvruch().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long HisNaamskeuzeongeborenvruch.countHisNaamskeuzeongeborenvruches() {
        return entityManager().createQuery("SELECT COUNT(o) FROM HisNaamskeuzeongeborenvruch o", Long.class).getSingleResult();
    }
    
    public static List<HisNaamskeuzeongeborenvruch> HisNaamskeuzeongeborenvruch.findAllHisNaamskeuzeongeborenvruches() {
        return entityManager().createQuery("SELECT o FROM HisNaamskeuzeongeborenvruch o", HisNaamskeuzeongeborenvruch.class).getResultList();
    }
    
    public static HisNaamskeuzeongeborenvruch HisNaamskeuzeongeborenvruch.findHisNaamskeuzeongeborenvruch(Integer id) {
        if (id == null) return null;
        return entityManager().find(HisNaamskeuzeongeborenvruch.class, id);
    }
    
    public static List<HisNaamskeuzeongeborenvruch> HisNaamskeuzeongeborenvruch.findHisNaamskeuzeongeborenvruchEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM HisNaamskeuzeongeborenvruch o", HisNaamskeuzeongeborenvruch.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void HisNaamskeuzeongeborenvruch.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void HisNaamskeuzeongeborenvruch.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            HisNaamskeuzeongeborenvruch attached = HisNaamskeuzeongeborenvruch.findHisNaamskeuzeongeborenvruch(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void HisNaamskeuzeongeborenvruch.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void HisNaamskeuzeongeborenvruch.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public HisNaamskeuzeongeborenvruch HisNaamskeuzeongeborenvruch.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        HisNaamskeuzeongeborenvruch merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
