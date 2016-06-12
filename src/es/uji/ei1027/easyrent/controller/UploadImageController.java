package es.uji.ei1027.easyrent.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import es.uji.ei1027.easyrent.dao.ImageDao;
import es.uji.ei1027.easyrent.domain.Image;
import es.uji.ei1027.easyrent.domain.ImageFile;
import es.uji.ei1027.easyrent.domain.Invoice;
import es.uji.ei1027.easyrent.domain.Property;


@Controller
@RequestMapping("/image")
public class UploadImageController {

	private Image img;
	
	
		

	@RequestMapping(value="/add")
	public String upload(Model model) {
		return "image/upload";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String processAddSubmit(@ModelAttribute("imageFile") ImageFile imageFile, BindingResult bindingResult) {
		if (bindingResult.hasErrors())
			return "image/upload";
		try{
			grabarFicheroALocal(imageFile);
		
		}catch( Exception e){
			e.printStackTrace();
			return "No se ha podido guardar el fichero";
		}
		return "Fichero guardado correctamente";
	}
	private void grabarFicheroALocal(ImageFile fileFormBean) throws Exception {
		
		CommonsMultipartFile uploaded = fileFormBean.getFichero();
		
		File localFile = new File("fichero");
    	
    	FileOutputStream os = null;
    	/*
    	try {
    		
    		os = new FileOutputStream(localFile);
    		os.write(uploaded.getBytes());
    		
    	} finally {
    		if (os != null) {
    			try {
					os.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
    		}
    	}*/
	}
	/*public String proccesAddSubmit(@ModelAttribute("image") Image image, BindingResult bindingResult){
		if(bindingResult.hasErrors())
			return "image/upload";
		//ImageDao.addImage(image);
		return "redirect:add.html";
	}*/
}
