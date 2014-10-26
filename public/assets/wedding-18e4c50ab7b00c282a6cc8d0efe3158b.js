$( document ).ready(function() {
    
$( "#code_form" ).on( "submit", function( event ) {
	event.preventDefault()
	$.ajax({
    	  type: 'post',
    	  url: '/guests/code_check',
    	  data : $(this).serialize(),
    	  success: function(resp) {
    	  		if(resp == true){
    	  		
    	  		$('#code_form').css('display', 'none')
    	  		$('#form_error').css('display', 'none')
    	  		$('#form_rsvp').css('display', 'block')
    	  		} else {
    	  		$('#form_error').css('display', 'block')
    	  		}
    	  },
    	  error: function(resp) {
    	  	console.log(resp)

    	  }
    	});
  
});
});
