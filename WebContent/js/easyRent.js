$(document).ready(function() {
		
		var dateInit = new Date($('#datePickerInit').datepicker("getDate"));
	    $('#datePickerInit')
	        .datepicker({
	        	  autoclose: true,    // It is false, by default
	        	  format: 'dd/mm/yyyy',
	              
	               
	        }).on('changeDate', function(e) {
	            // Revalidate the date field
	        	 dateInit = new Date($('#datePickerInit').datepicker("getDate")); 
	            
	        	 $('#datePickerEnd input').prop('disabled', false);
	          $('#datePickerEnd').datepicker({
	        	  	autoclose: true,
	 	            format: 'mm/dd/yyyy',
	 	            startDate: dateInit, 
	 	        })
				
	        });
	});