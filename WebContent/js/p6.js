var contextPath="/jcf-showcase/";

!function ($) {

	$(function(){
		$(function() {
			$.ajax({
				dataType : "json"
			  , contentType : "application/json+sua; charset=UTF-8"
			  , type : "POST"
              , url : contextPath +"sample/example/getExampleList.do"
              , success : function(reponse, status, request){
            	  var data = reponse.DS_OUT;
            	  //var deptCode=reponse.DEPT_CD;
            	  var s = '';
            	  //var s2 = '<option  selected="selected">부서선택</option>';
            	  var obj;

            	  for(var i = 0, len = data.length; i < len; i++){
	      			  obj = data[i];
	      			  s += '<tr>';
	      			  s += '<td name="applyId"><u>' + obj.applyId + ' </></td>';
	      			  s += '<td>' + obj.applyName + '</td>';
	      			  s += '<td>' + obj.phoneNum + '</td>';
	      			  s += '<td>' + obj.deptName + '</td>';
	      			  s += '</tr>';
            	  }

            	  $('#p61_1 table tbody').html(s);
              }
              , error : function(request, status, error){
            	  console.log("통신실패");
              }
			});
		});

		$('#p61_1 table').on('click' ,'td[name=applyId]', function(e){
    		e.preventDefault();
    		getApply($(e.target).text());
    	});

        $('#p62_1_btn1').click(function(e){
            $('#p62_1_applyId').val("");
            $('#p62_1_applyName').val("");
            $('#p62_1_phoneNum').val("");

            var img='<label class="control-label" for="p21_2_param3">사진 업로드</label><div class="controls"><input type="file"  ame="dbFileId">';
            $('#p62_1_pic').html(img);
        });

        $('#p62_1_btn2').click(function(e){
        	document.getElementById("p62_1_Form").submit();
        });
	});

}(window.jQuery);

function getApply(applyId) {
    $.ajax({
        dataType : "json"
      , contentType : "application/extJs+sua; charset=UTF-8"
      , type : "POST"
      , url : contextPath + "sample/example/getExample.do?applyId=" + applyId
      , success : function(reponse, status, request){
    	  $('#p62_1_applyName').val(reponse.DS_OUT.applyName);
          $('#p62_1_phoneNum').val(reponse.DS_OUT.phoneNum);
          $('#p62_1_applyDept').val(reponse.DS_OUT.applyDept);
          $('#p62_1_applyName').val(reponse.DS_OUT.applyName);
          $('#p62_1_applyId').val(reponse.DS_OUT.applyId);
          $('#p62_1_attchId').val(reponse.DS_OUT.fileSysId);
          $('#p62_1_dbFileId').val(reponse.DS_OUT.dbFileId);

          if (!reponse.DS_OUT.dbFileId==0) {
        	 var img='<div id="p62_1_pic" ><label class="control-label" for="p21_2_param3">사진</label><div class="controls"><img class="img-polaroid" height="200" width="150" src='+contextPath+ 'download.do?file_Type=DB&fileId=' +reponse.DS_OUT.dbFileId+'></div></div>';
        	 $('#p62_1_pic').html(img);
          } else {
        	 var img='<label class="control-label" for="p21_2_param3">사진 업로드</label><div class="controls"><input type="file" name="dbFileId">';
        	 $('#p62_1_pic').html(img);
          }

          if (!reponse.DS_OUT.fileSysId=="") {
	         var p62_4_iframe_div='	<div class="btn btn-link"><a href=' + contextPath + 'sample/example/getAttachFileDownload.do?fileId=' + reponse.DS_OUT.fileSysId + '>다운받기</a></div>';
	         $('#p62_4_iframe').html(p62_4_iframe_div);
          } else {
	    	 var p62_4_iframe_div=' <iframe src="openpage.do?viewname=p6_iframe_1" width="500" height="100" name="main" style="border:0;"></iframe>';
	         $('#p62_4_iframe').html(p62_4_iframe_div);
          }
      }
      , error : function(request, status, error){
    	  console.log("통신실패");
      }
    });
  }


function getiFrameData(param1, param2, param3) {
	$('#p62_1_attchId').val(param1);
	$('#p62_1_attchFold').val(param2);
	$('#p62_1_attchName').val(param3);

	var successData="<div class='bs-docs-example-result'><p>파일 이름 : " + param3 +"<br/>업로드 경로 : " + param2 + "<br/>서버에 저장된 파일이름 : " + param1 + "</p></div>";

	$('#p62_4_iframe').html(successData);
}