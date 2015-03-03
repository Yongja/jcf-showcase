!function ($) {
	var contextPath="/jcf-showcase/";

	$(function(){
		$(function() {
		    $( "#p11_3_param3" ).datepicker();
		    $( "#p11_4_param3" ).datepicker();
		    $( "#p11_5_param3" ).datepicker();
		    $( "#p11_6_param3" ).datepicker();
		    $( "#p11_7_param1_3" ).datepicker();
		    $( "#p11_7_param2_3" ).datepicker();
		    $( "#p11_7_param3_3" ).datepicker();
		    $( "#p11_8_param1_3" ).datepicker();
		    $( "#p11_8_param2_3" ).datepicker();
		    $( "#p11_8_param3_3" ).datepicker();
		});

		$('#p11_1_btn1').click(function(e){
			e.preventDefault();

			var param1 = encodeURIComponent($('#p11_1_param1').val() );
			var url = contextPath +"sample/sua/getParamByString.do?param1="+param1;

			$.ajax({
		          dataType : "json"
		        , contentType : "application/json+sua; charset=UTF-8"
		        , type : "GET"
		        , url : url
		        , success : function(reponse, status, request){
		          $('#p11_1_result').html(reponse.success);
		        }
		        , error : function(request, status, error){
		          console.log("통신실패");
		        }
			});
		});

		$('#p11_2_btn1').click(function(e){
			e.preventDefault();

			var param1 = encodeURIComponent($('#p11_2_param1').val() );
		    var param2 =  encodeURIComponent($('#p11_2_param2').val() );
		    var url=contextPath +"sample/sua/getParamByMap.do?param1="+param1+"&param2="+param2;

		    $.ajax({
		          dataType : "json"
		        , contentType : "application/json+sua; charset=UTF-8"
		        , type : "GET"
		        , url : url
		        , success : function(reponse, status, request){
		          $('#p11_2_result').html(reponse.success);
		        }
		        , error : function(request, status, error){
		          console.log("통신실패");
		        }
		    });
		});

		$('#p11_2_btn2').click(function(e){
			e.preventDefault();

			var param1 = $('#p11_2_param1').val();
			var param2 = $('#p11_2_param2').val();

			var sendData = JSON.stringify({param1 : param1, param2 : param2});
		});

		$('#p11_3_btn1').click(function(e){
			e.preventDefault();

	        var param1 = $('#p11_3_param1').val();
	        var param2 = $('#p11_3_param2').val();
	        var param3 = $('#p11_3_param3').val();
	        var sendData = JSON.stringify({DS_IN :{name : param1, age : param2, regiDate : param3 }});

	        $.ajax({
	            dataType : "json"
	          , contentType : "application/json+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/getJavaBean.do"
	          , data : sendData
	          , success : function(reponse, status, request){
	        	  $('#p11_3_result').html(reponse.success);
	          }
	          , error : function(request, status, error){
	            console.log("통신실패");
	          }
	        });
		});

		$('#p11_4_btn1').click(function(e){
			document.getElementById("p11_4_Form").submit();
		});

		$('#p11_5_btn1').click(function(e){
			e.preventDefault();

	        var param1 = $('#p11_5_param1').val();
	        var param2 = $('#p11_5_param2').val();
	        var param3 = $('#p11_5_param3').val();

	        var sendData = JSON.stringify({DS_IN :{name : param1, age : param2, regiDate : param3}});

	        $.ajax({
	            dataType : "json"
	          , contentType : "application/json+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/getMap.do"
	          , data : sendData
	          , success : function(reponse, status, request){
	        	  $('#p11_5_result').html(reponse.success);
	          }
	          , error : function(request, status, error){
	            console.log("통신실패");
	          }
	       });
		});

		$('#p11_6_btn1').click(function(e){
			document.getElementById("p11_6_Form").submit();
		});

		$('#p11_7_btn1').click(function(e){
			e.preventDefault();

	        var p11_7_param1_1 = $('#p11_7_param1_1').val();
	        var p11_7_param1_2 = $('#p11_7_param1_2').val();
	        var p11_7_param1_3 = $('#p11_7_param1_3').val();
	        var p11_7_param1_4 = $('#p11_7_param1_4').val();

	        var p11_7_param2_1 = $('#p11_7_param2_1').val();
	        var p11_7_param2_2 = $('#p11_7_param2_2').val();
	        var p11_7_param2_3 = $('#p11_7_param2_3').val();
	        var p11_7_param2_4 = $('#p11_7_param2_4').val();

	        var p11_7_param3_1 = $('#p11_7_param3_1').val();
	        var p11_7_param3_2 = $('#p11_7_param3_2').val();
	        var p11_7_param3_3 = $('#p11_7_param3_3').val();
	        var p11_7_param3_4 = $('#p11_7_param3_4').val();

	        var sendData = JSON.stringify({DS_IN :[{name : p11_7_param1_1, age : p11_7_param1_2, regiDate : p11_7_param1_3, rowStatus : p11_7_param1_4},
	                                               {name : p11_7_param2_1, age : p11_7_param2_2, regiDate : p11_7_param2_3, rowStatus : p11_7_param2_4},
	                                               {name : p11_7_param3_1, age : p11_7_param3_2, regiDate : p11_7_param3_3, rowStatus : p11_7_param3_4}
                                         ]});

	        $.ajax({
	            dataType : "json"
	          , contentType : "application/json+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/getJavaBeans.do"
	          , data : sendData
	          , success : function(reponse, status, request){
	        	  $('#p11_7_result').html(reponse.success);
	            }
	          , error : function(request, status, error){
	            console.log("통신실패");
	            }
	        });
		});

		$('#p11_8_btn1').click(function(e){
			e.preventDefault();

			var p11_8_param1_1 = $('#p11_8_param1_1').val();
	        var p11_8_param1_2 = $('#p11_8_param1_2').val();
	        var p11_8_param1_3 = $('#p11_8_param1_3').val();
	        var p11_8_param1_4 = $('#p11_8_param1_4').val();

	        var p11_8_param2_1 = $('#p11_8_param2_1').val();
	        var p11_8_param2_2 = $('#p11_8_param2_2').val();
	        var p11_8_param2_3 = $('#p11_8_param2_3').val();
	        var p11_8_param2_4 = $('#p11_8_param2_4').val();

	        var p11_8_param3_1 = $('#p11_8_param3_1').val();
	        var p11_8_param3_2 = $('#p11_8_param3_2').val();
	        var p11_8_param3_3 = $('#p11_8_param3_3').val();
	        var p11_8_param3_4 = $('#p11_8_param3_4').val();

	        var sendData = JSON.stringify({DS_IN :[{name : p11_8_param1_1, age : p11_8_param1_2, regiDate : p11_8_param1_3, rowStatus : p11_8_param1_4},
	                                               {name : p11_8_param2_1, age : p11_8_param2_2, regiDate : p11_8_param2_3, rowStatus : p11_8_param2_4},
	                                               {name : p11_8_param3_1, age : p11_8_param3_2, regiDate : p11_8_param3_3, rowStatus : p11_8_param3_4}
                                          ]});
	        $.ajax({
	            dataType : "json"
	          , contentType : "application/json+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/getMapList.do"
	          , data : sendData
	          , success : function(reponse, status, request){
	        	  $('#p11_8_result').html(reponse.success);
	            }
	          , error : function(request, status, error){
	            console.log("통신실패");
	          	}
	        });
		});

		$('#p11_9_btn1').click(function(e){
			var url=contextPath +"sample/sua/getRequestURL.do";

			$.ajax({
	            dataType : "json"
	          , contentType : "application/json+sua; charset=UTF-8"
	          , type : "POST"
	          , url :url
	          , success : function(reponse, status, request){
	              $('#p11_9_result').html(reponse.success);
	           }
	          , error : function(request, status, error){
	            console.log("통신실패");
	           }
			});
		});

		$('#p12_1_btn1').click(function(e){
			$.ajax({
	            dataType : "json"
	          , contentType : "application/extJs+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/sendStringData.do"
	          , success : function(reponse, status, request){
	             $('#p12_1_param1').val(reponse.param);
	            }
	          , error : function(request, status, error){
	            console.log("통신실패");
	          	}
			});
		});

		$('#p12_2_btn1').click(function(e){
			$.ajax({
	            dataType : "json"
	          , contentType : "application/extJs+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/sendJavaBean.do"
	          , success : function(reponse, status, request){
	        	 $('#p12_2_param1').val(reponse.DS_OUT.name);
	             $('#p12_2_param2').val(reponse.DS_OUT.age);
	             $('#p12_2_param3').val(reponse.DS_OUT.regiDate);
	          }
	          , error : function(request, status, error){
	            console.log("통신실패");
	          }
			});
		});

		$('#p12_3_btn1').click(function(e){
			$.ajax({
	            dataType : "json"
	          , contentType : "application/extJs+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/sendMap.do"
	          , success : function(reponse, status, request){
	        	 $('#p12_3_param1').val(reponse.DS_OUT.name);
	             $('#p12_3_param2').val(reponse.DS_OUT.age);
	             $('#p12_3_param3').val(reponse.DS_OUT.regiDate);
	            }
	          , error : function(request, status, error){
	            console.log("통신실패");
	          	}
			});
		});

		$('#p12_4_btn1').click(function(e){
			$.ajax({
	            dataType : "json"
	          , contentType : "application/extJs+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/sendJavaBeanList.do"
	          , success : function(reponse, status, request){
	        	  var data=reponse.DS_OUT;
	        	  var s = '';
	    		  var obj;

	    		  for(var i = 0, len = data.length; i < len; i++){
	    			  obj = data[i];
	    			  s += '<tr>';
	    			  s += '<td>' + obj.name + '</td>';
	    			  s += '<td>' + obj.age + '</td>';
	    			  s += '<td>' + obj.regiDate + '</td>';
	    			  s += '</tr>';
	    		  }

	    		  $('#p12_4 table tbody').html(s);
	          	}
	          , error : function(request, status, error){
	            console.log("통신실패");
	          	}
			});
		});

		$('#p12_5_btn1').click(function(e){
			$.ajax({
	            dataType : "json"
	          , contentType : "application/extJs+sua; charset=UTF-8"
	          , type : "POST"
	          , url : contextPath +"sample/sua/sendMapList.do"
	          , success : function(reponse, status, request){
	        	  var data=reponse.DS_OUT;
	        	  var s = '';
	    		  var obj;

	    		  for(var i = 0, len = data.length; i < len; i++){
	    			  obj = data[i];
	    			  s += '<tr>';
	    			  s += '<td>' + obj.name + '</td>';
	    			  s += '<td>' + obj.age + '</td>';
	    			  s += '<td>' + obj.regiDate + '</td>';
	    			  s += '</tr>';
	    		  }

	    		  $('#p12_5 table tbody').html(s);
	          	}
	          , error : function(request, status, error){
	            console.log("통신실패");
	          	}
			});
		});

		$('#p12_6_btn1').click(function(e){
			document.getElementById("p12_6_form").submit();
		});
	});

}(window.jQuery);

function onlyNumber(loc) {
	if(/[^0123456789]/g.test(loc.value)) {
		alert("나이는 숫자만 허용합니다.");
		loc.value = "";
		loc.focus();

		return false;
	}
}