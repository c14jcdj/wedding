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

$(".rsvp_yes").on("change", function(){
  $('#form_food').css('display', 'block')
});

$(".rsvp_no").on("change", function(){
  $('#form_food').css('display', 'none')
});

function countdown(){
    var target_date = new Date("Jun 20, 2015").getTime(),
        countdown = document.getElementById("countdown"),
        days, 
        hours, 
        minutes, 
        seconds;
     
     
    setInterval(function () {
     
        var current_date = new Date().getTime();
        var seconds_left = (target_date - current_date) / 1000;
     
        days = parseInt(seconds_left / 86400);
        seconds_left = seconds_left % 86400;
         
        hours = parseInt(seconds_left / 3600);
        seconds_left = seconds_left % 3600;
         
        minutes = parseInt(seconds_left / 60);
        seconds = parseInt(seconds_left % 60);
         
        countdown.innerHTML = days + "days " + hours + "hours "
        + minutes + "mins " + seconds + "sec";  
     
    }, 1000);

}


    function appendWeddingPartyContainers (){
        
        var names = ['jo', 'blow', 'lo']

        function weddingPartyContainers(name){
            return '<div class="wpContainers"> \
                    <h1>'+name+'</h1>\
                    </div>'
        }

        for(var i=0; i < names.length; i++){
            $('.bridal_party').append(weddingPartyContainers(names[i]))
            $('.groomsmen').append(weddingPartyContainers(names[i]))
        }
    }

appendWeddingPartyContainers()
// countdown()



});