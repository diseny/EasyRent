package es.uji.ei1027.easyrent.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import es.uji.ei1027.easyrent.dao.InvoiceDao;
import es.uji.ei1027.easyrent.domain.Invoice;

@Controller
@RequestMapping("/invoice")
public class InvoiceController {
	
	private InvoiceDao invoiceDao; 

	@Autowired
	public void setInvoiceDao(InvoiceDao invoiceDao) {
		this.invoiceDao = invoiceDao;
	}

	@RequestMapping("/list") 
	public String listInvoice(Model model) {
		model.addAttribute("invoice", invoiceDao.getInvoices());
		return "invoice/list";
	}

	@RequestMapping(value="/add") 
	public String addOwner(Model model) {
		model.addAttribute("invoice", new Invoice());
		return "invoice/add";
	}

	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("invoice") Invoice invoice, BindingResult bindingResult) {
		//InvoiceValidator invoiceValidator = new InvoiceValidator();
		//InvoiceValidator.validate(invoice, bindingResult);
		if (bindingResult.hasErrors())
			return "invoice/add";
		try {
			invoice.setIsActive(true);
			invoiceDao.addInvoice(invoice);
		} catch (Exception e) {
			if(e.getMessage()==null){
				return "redirect:list.html";
			}
			else{
				if(e.getMessage().contains("already exists")){
					bindingResult.rejectValue("username", "obligatori", "Parece que ya hay un Owner con el username indicado.");
				} else if(e.getMessage().contains("not present")){
					bindingResult.rejectValue("username", "obligatori", "Parece que el username no está registrado.");
				} 
				
				return "invoice/add";
			}
		}
		return "redirect:list.html";
	 }
	/*
	@RequestMapping(value="/update/{username}", method = RequestMethod.GET)
	public String editInvoice(Model model, @PathVariable String username) {
		model.addAttribute("invoice", invoiceDao.getInvoice(username));
		return "invoice/update"; 
	}

	@RequestMapping(value="/update/{username}", method = RequestMethod.POST) 
	public String processUpdateSubmit(@PathVariable String username, @ModelAttribute("invoice") Invoice invoice, BindingResult bindingResult) {
		//InvoiceValidator InvoiceValidator = new InvoiceValidator();
		InvoiceValidator.validate(invoice, bindingResult);
		if (bindingResult.hasErrors()) 
			return "invoice/update";
		invoiceDao.updateInvoice(invoice);
		return "redirect:../list.html"; 
	}
	
	@RequestMapping(value="/delete/{username}", method = RequestMethod.GET)
	public String deleteInvoice(Model model, @PathVariable String username) {
		model.addAttribute("Invoice", InvoiceDao.getInvoice(username));
		return "Invoice/delete"; 
	}

	@RequestMapping(value="/delete/{username}", method = RequestMethod.POST) 
	public String processDeleteSubmit(@PathVariable String username, @ModelAttribute("Invoice") Invoice Invoice, BindingResult bindingResult) {
		if (bindingResult.hasErrors()) 
			return "Invoice/delete";
		InvoiceDao.deleteInvoice(Invoice);
		return "redirect:../list.html"; 
	}*/
	
}
