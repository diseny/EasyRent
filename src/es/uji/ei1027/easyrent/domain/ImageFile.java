package es.uji.ei1027.easyrent.domain;

import org.apache.tomcat.util.http.fileupload.FileItem;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ImageFile {
	CommonsMultipartFile fichero;
	

	public CommonsMultipartFile getFichero(){
		return fichero;
	}
	public void setFichero(CommonsMultipartFile fichero){
		this.fichero= fichero;
	}
}
