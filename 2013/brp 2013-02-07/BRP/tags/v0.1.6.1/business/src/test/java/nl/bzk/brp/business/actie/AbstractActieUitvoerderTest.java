/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.business.actie;

import java.util.ArrayList;
import java.util.List;

import nl.bzk.brp.business.dto.BerichtContext;
import nl.bzk.brp.business.dto.BerichtenIds;
import nl.bzk.brp.dataaccess.repository.ActieRepository;
import nl.bzk.brp.model.gedeeld.Partij;
import nl.bzk.brp.model.logisch.BRPActie;
import nl.bzk.brp.model.operationeel.kern.PersistentActie;
import nl.bzk.brp.model.validatie.Melding;
import nl.bzk.brp.model.validatie.MeldingCode;
import nl.bzk.brp.model.validatie.SoortMelding;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Matchers;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.test.util.ReflectionTestUtils;

public abstract class AbstractActieUitvoerderTest {

    @Mock
    private ActieRepository actieRepository;
    @Mock
    private AbstractActieUitvoerder abstractActieUitvoerder;

    private BRPActie actie;
    private BerichtContext context;

    @Before
    public void init() {
        MockitoAnnotations.initMocks(this);
        ReflectionTestUtils.setField(abstractActieUitvoerder, "actieRepository", actieRepository);
        actie = new BRPActie();
        context = new BerichtContext(new BerichtenIds(1L, 2L), 1, new Partij(), "");
    }

    @Test
    public void testVoeruitRoeptJuisteFunctiesAan() {
        List<Melding> meldingen = abstractActieUitvoerder.voerUit(actie, context);
        Mockito.verify(abstractActieUitvoerder, Mockito.times(1)).valideerActieGegevens(actie);
        Mockito.verify(abstractActieUitvoerder, Mockito.times(1)).bereidActieVerwerkingVoor(actie, context);
        Mockito.verify(abstractActieUitvoerder, Mockito.times(1)).verwerkActie(actie, context);

        Assert.assertTrue(meldingen.isEmpty());
    }

    @Test
    public void testVoeruitStoptNaValideerActieGegevensBijMeldingen() {
        List<Melding> meldingen = new ArrayList<Melding>();
        meldingen.add(new Melding(SoortMelding.FOUT_OVERRULEBAAR, MeldingCode.ALG0002));
        Mockito.when(abstractActieUitvoerder.valideerActieGegevens(actie)).thenReturn(meldingen);

        List<Melding> meldingenUit = abstractActieUitvoerder.voerUit(actie, context);

        Mockito.verify(abstractActieUitvoerder, Mockito.times(1)).valideerActieGegevens(actie);
        Mockito.verify(abstractActieUitvoerder, Mockito.never()).bereidActieVerwerkingVoor(actie, context);
        Mockito.verify(abstractActieUitvoerder, Mockito.never()).verwerkActie(actie, context);

        Assert.assertNotNull(meldingenUit);
        Assert.assertEquals(meldingenUit.size(), meldingen.size());
    }

    @Test
    public void testVoeruitStoptNaBereidActieVerwerkingVoorBijMeldingen() {
        List<Melding> meldingen = new ArrayList<Melding>();
        meldingen.add(new Melding(SoortMelding.FOUT_OVERRULEBAAR, MeldingCode.ALG0002));
        Mockito.when(abstractActieUitvoerder.bereidActieVerwerkingVoor(actie, context)).thenReturn(meldingen);

        List<Melding> meldingenUit = abstractActieUitvoerder.voerUit(actie, context);

        Mockito.verify(abstractActieUitvoerder, Mockito.times(1)).valideerActieGegevens(actie);
        Mockito.verify(abstractActieUitvoerder, Mockito.times(1)).bereidActieVerwerkingVoor(actie, context);
        Mockito.verify(abstractActieUitvoerder, Mockito.never()).verwerkActie(actie, context);

        Assert.assertNotNull(meldingenUit);
        Assert.assertEquals(meldingenUit.size(), meldingen.size());
    }

    @Test
    public void testPersisteerActie() {
        abstractActieUitvoerder = new AbstractActieUitvoerder() {

            @Override
            List<Melding> valideerActieGegevens(final BRPActie eenActie) {
                return null;
            }

            @Override
            List<Melding> verwerkActie(final BRPActie eenActie, final BerichtContext berichtContext) {
                return null;
            }

            @Override
            List<Melding> bereidActieVerwerkingVoor(final BRPActie eenActie, final BerichtContext berichtContext) {
                return null;
            }
        };
        ReflectionTestUtils.setField(abstractActieUitvoerder, "actieRepository", actieRepository);
        abstractActieUitvoerder.persisteerActie(actie, context);
        Mockito.verify(actieRepository, Mockito.times(1)).save(Matchers.any(PersistentActie.class));
    }
}
