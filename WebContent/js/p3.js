!function ($) {
	var contextPath="/jcf-showcase/";

	$(function(){
	    $('#p31_1_btn1').click(function(e){
	    	e.preventDefault();

	    	$.ajax({
	          dataType : "json"
	        , contentType : "application/json+sua; charset=UTF-8"
	        , type : "POST"
	        , url : contextPath+"/sample/stream/getLargeData.do"
	        , success : function(reponse, status, request){
		          		var data = reponse.sample;
		        	  	var s = '';
		        	  	var obj;

		        	  	for(var i = 0, len = data.length; i < len; i++){
		        	  		obj = data[i];
		        	  		s += obj.title + ' ' + obj.content + ' ' + obj.userId;
		        	  	}

        	  			$('#p31_1_result').html(s);
	        		}
	        , error : function(request, status, error) {
	        				console.log("통신실패");
	        		}
	    	});
	    });

	    $('#p31_1_btn2').click(function(e){
	    	$('#p31_1_result').html("");
	    });

	    $('#p31_2_btn2').click(function(e){
	    	e.preventDefault();

	    	$.ajax({
	            dataType : "json"
	          , contentType : "application/extJs+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/stream/getLargeData.do"
	          , success : function(reponse, status, request){

	          		var data = reponse.sample;
	        	  	var s = '';
	        	  	var obj;

	        	  	for(var i = 0, len = data.length; i < len; i++){
	        	  		obj = data[i];
	        	  		s += '<tr>';
	        	  		s += '<td>' + obj.title + '</td>';
	        	  		s += '<td>' + obj.content + '</td>';
	        	  		s += '<td>' + obj.userId + '</td>';
	        	  		s += '</tr>';
	        	  	}

	        	  	$('#p31_2 table tbody').html(s);
	          	}
	          , error : function(request, status, error){
	          	console.log("통신실패");
	          	}
	  		});
	    });

	});

}(window.jQuery);