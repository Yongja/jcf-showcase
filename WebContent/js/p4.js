!function ($) {
	var contextPath="/jcf-showcase/";

	$(function(){
		$('#p41_0_btn1').click(function(e){
			e.preventDefault();

			$.ajax({
				dataType : "json"
			  , contentType : "application/json+sua; charset=UTF-8"
		      , type : "POST"
		      , url : contextPath + "sample/exception/makeBizException.do"
		      , success : function(reponse, status, request){
		    	  $('#p41_0_result').html(reponse.exception);
		      }
			  , error : function(request, status, error){
				  console.log("통신실패");
			  }
			});
		});

		$('#p41_1_btn1').click(function(e){
			e.preventDefault();

			$.ajax({
				dataType : "json"
			  , contentType : "application/json+sua; charset=UTF-8"
			  , type : "POST"
		      , url : contextPath + "sample/exception/makeBizExceptionWithParam.do"
		      , success : function(reponse, status, request){
	              $('#p41_1_result').html(reponse.exception);
		      }
	          , error : function(request, status, error){
	        	  console.log("통신실패");
	          }
			});
		});

		$('#p41_2_btn1').click(function(e){
			e.preventDefault();

			$.ajax({
				dataType : "json"
			  , contentType : "application/json+sua; charset=UTF-8"
			  , type : "POST"
			  , url : contextPath + "sample/exception/makeSysException.do"
			  , success : function(reponse, status, request){
				  $('#p41_2_result').html(reponse.exception);
			    }
			  , error : function(request, status, error){
				  $('#p41_2_result').html("예상치 못한 시스템 예외가 발생하였습니다.");
			    }
			});
		});

		$('#p42_3_btn1').click(function(e){
			e.preventDefault();

			$.ajax({
				dataType : "json"
			  , contentType : "application/json+sua; charset=UTF-8"
			  , type : "POST"
			  , url : contextPath + "sample/messages/getLocalMsg.do"
			  , success : function(reponse, status, request){
				  $('#p42_3_result').html(reponse.success);
	          	}
	          , error : function(request, status, error){
	        	  console.log("통신실패");
	          	}
			});
		});

	    $('#p42_2_btn1').click(function(e){
	    	e.preventDefault();

	    	var lang = "KR";
	    	var url = contextPath + "sample/messages/getMultiLang.do?toLang=" + lang;

	    	$.ajax({
	    		dataType : "json"
	          , contentType : "application/json+sua; charset=UTF-8"
	          , type : "POST"
	          , url :url
	          , success : function(reponse, status, request){
	        	  $('#p42_2_result').html(reponse.success);
	            }
	          , error : function(request, status, error){
	         	  console.log("통신실패");
	          	}
	    	});
	    });

	    $('#p42_2_btn2').click(function(e){
	    	e.preventDefault();

	    	var lang = "EN";
	    	var url = contextPath + "sample/messages/getMultiLang.do?toLang=" + lang;

	    	$.ajax({
	            dataType : "json"
	          , contentType : "application/json+sua; charset=UTF-8"
	          , type : "POST"
	          , url : url
	          , success : function(reponse, status, request){
	        	  $('#p42_2_result').html(reponse.success);
	            }
	          , error : function(request, status, error){
	        	  console.log("통신실패");
	            }
	    	});
	    });
	});

}(window.jQuery);
