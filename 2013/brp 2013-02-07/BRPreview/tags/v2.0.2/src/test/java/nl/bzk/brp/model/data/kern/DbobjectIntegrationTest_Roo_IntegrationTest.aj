// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.data.kern;

import java.util.List;
import nl.bzk.brp.model.data.kern.Dbobject;
import nl.bzk.brp.model.data.kern.DbobjectDataOnDemand;
import nl.bzk.brp.model.data.kern.DbobjectIntegrationTest;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DbobjectIntegrationTest_Roo_IntegrationTest {
    
    declare @type: DbobjectIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: DbobjectIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: DbobjectIntegrationTest: @Transactional;
    
    @Autowired
    private DbobjectDataOnDemand DbobjectIntegrationTest.dod;
    
    @Test
    public void DbobjectIntegrationTest.testCountDbobjects() {
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to initialize correctly", dod.getRandomDbobject());
        long count = Dbobject.countDbobjects();
        Assert.assertTrue("Counter for 'Dbobject' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void DbobjectIntegrationTest.testFindDbobject() {
        Dbobject obj = dod.getRandomDbobject();
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to provide an identifier", id);
        obj = Dbobject.findDbobject(id);
        Assert.assertNotNull("Find method for 'Dbobject' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'Dbobject' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void DbobjectIntegrationTest.testFindAllDbobjects() {
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to initialize correctly", dod.getRandomDbobject());
        long count = Dbobject.countDbobjects();
        Assert.assertTrue("Too expensive to perform a find all test for 'Dbobject', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<Dbobject> result = Dbobject.findAllDbobjects();
        Assert.assertNotNull("Find all method for 'Dbobject' illegally returned null", result);
        Assert.assertTrue("Find all method for 'Dbobject' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void DbobjectIntegrationTest.testFindDbobjectEntries() {
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to initialize correctly", dod.getRandomDbobject());
        long count = Dbobject.countDbobjects();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<Dbobject> result = Dbobject.findDbobjectEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'Dbobject' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'Dbobject' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void DbobjectIntegrationTest.testPersist() {
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to initialize correctly", dod.getRandomDbobject());
        Dbobject obj = dod.getNewTransientDbobject(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'Dbobject' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        Assert.assertNotNull("Expected 'Dbobject' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void DbobjectIntegrationTest.testRemove() {
        Dbobject obj = dod.getRandomDbobject();
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to initialize correctly", obj);
        Integer id = obj.getId();
        Assert.assertNotNull("Data on demand for 'Dbobject' failed to provide an identifier", id);
        obj = Dbobject.findDbobject(id);
        obj.remove();
        obj.flush();
        Assert.assertNull("Failed to remove 'Dbobject' with identifier '" + id + "'", Dbobject.findDbobject(id));
    }
    
}
