
$(document).ready(function() {

	
	var hoy = new Date();
	var dates = ['16/06/2016','18/06/2016']
	$('#datePickerInit').datepicker({
		autoclose : true,
		
		format : 'dd/mm/yyyy',
		startDate : hoy,
		endDate: dates[0]
		
		
	})
	//console.log($('#datePickerInit').datepicker())
	
	
	
 
	var dateInit = new Date($('#datePickerInit').datepicker("getDate"));
	$('#datePickerInit').on('changeDate', function(e) {
		// Revalidate the date field
		dateInit = new Date($('#datePickerInit').datepicker("getDate"));

		$('#datePickerEnd input').prop('disabled', false);
		$('#datePickerEnd').datepicker({
			autoclose : true,
			format : 'dd/mm/yyyy',
			startDate : dateInit,
		})

	});
});
