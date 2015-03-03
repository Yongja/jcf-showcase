$(document).ready(function() {
    $.ajax({
    	type:"POST",
    	 contentType: "application/json; charset=utf-8",
         dataType: "json",
        url: "http://api.data.go.kr/openapi/4f43aaf7-f391-4048-9532-f102b5ae0bbf?serviceKey=63cKTXSSLIa5yUJDQDLxn6d1s2Kpt%2FIYLol74pJsclTueGpBjq6KHfoeFSCgJFAN2QvjlpZ0Y%2B2%2FYgPWjEg1%2Bw%3D%3D&type=json"
    }).then(function(data) {
       $('.ws_flag').append(data.구분);
       $('.ws_hospital_name').append(data.병원명);
    });
});