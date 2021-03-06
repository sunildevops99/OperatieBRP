// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package nl.bzk.brp.model.web;

import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import nl.bzk.brp.model.data.autaut.Doelbindinggegevenselement;
import nl.bzk.brp.model.data.kern.Dbobject;
import nl.bzk.brp.model.data.kern.Gegeveninonderzoek;
import nl.bzk.brp.model.data.kern.Srtdbobject;
import nl.bzk.brp.model.data.lev.Abonnementgegevenselement;
import nl.bzk.brp.model.web.DbobjectController;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect DbobjectController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String DbobjectController.create(@Valid Dbobject dbobject, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, dbobject);
            return "dbobjects/create";
        }
        uiModel.asMap().clear();
        dbobject.persist();
        return "redirect:/dbobjects/" + encodeUrlPathSegment(dbobject.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String DbobjectController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Dbobject());
        return "dbobjects/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String DbobjectController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("dbobject", Dbobject.findDbobject(id));
        uiModel.addAttribute("itemId", id);
        return "dbobjects/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String DbobjectController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("dbobjects", Dbobject.findDbobjectEntries(firstResult, sizeNo));
            float nrOfPages = (float) Dbobject.countDbobjects() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("dbobjects", Dbobject.findAllDbobjects());
        }
        return "dbobjects/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String DbobjectController.update(@Valid Dbobject dbobject, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, dbobject);
            return "dbobjects/update";
        }
        uiModel.asMap().clear();
        dbobject.merge();
        return "redirect:/dbobjects/" + encodeUrlPathSegment(dbobject.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String DbobjectController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, Dbobject.findDbobject(id));
        return "dbobjects/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String DbobjectController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Dbobject dbobject = Dbobject.findDbobject(id);
        dbobject.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/dbobjects";
    }
    
    void DbobjectController.populateEditForm(Model uiModel, Dbobject dbobject) {
        uiModel.addAttribute("dbobject", dbobject);
        uiModel.addAttribute("doelbindinggegevenselements", Doelbindinggegevenselement.findAllDoelbindinggegevenselements());
        uiModel.addAttribute("dbobjects", Dbobject.findAllDbobjects());
        uiModel.addAttribute("gegeveninonderzoeks", Gegeveninonderzoek.findAllGegeveninonderzoeks());
        uiModel.addAttribute("srtdbobjects", Srtdbobject.findAllSrtdbobjects());
        uiModel.addAttribute("abonnementgegevenselements", Abonnementgegevenselement.findAllAbonnementgegevenselements());
    }
    
    String DbobjectController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
