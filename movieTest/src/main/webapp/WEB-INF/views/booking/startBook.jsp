<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="${request.contextpath}/resources/js/jquery-3.4.1.min.js"></script>
<script>
  $(function(){
    $('#title').change(function(){//영화를 선택(변경)했을 때
      if($('#theater').val()!="none"){//극장을 먼저 선택하고 영화를 선택했을 때
        var param = 'm_code='+$(this).val()+'&theater_name='+$('#theater').val();
    	$.ajax({
    	  url:'/movie/startBook3',
          data:param,
          success:function(result){
            var str ='<option value="none">영화상영시간을 선택해 주세요</option>';
            for(var i=0; i<result.length; i++){
              str += '<option value="'+result[i]['timetable_code']+'">'
                	 +result[i]['m_name']+', '
                	 +new Date(result[i]['start_time']).getFullYear()+"-"//연도-월-일 시:분 형태로 변경
                	 +(new Date(result[i]['start_time']).getMonth()+1)+"-"//월: +1
                	 +new Date(result[i]['start_time']).getDate()+" "
                	 +new Date(result[i]['start_time']).getHours()+":"
                	 +new Date(result[i]['start_time']).getMinutes()
                	 +', '+result[i]['screen_name']+'</option>';
            }
            $('#time').html(str);			  
          } 
    	})
      }      
	})
	      
    $('#local').change(function(){//지역을 선택(변경)했을 때
      var param ='theater_area='+ $(this).val();
        $.ajax({
          url:'/movie/startBook2',
          data:param,
          success:function(result){
            var str ='<option value="none">극장을 선택해 주세요</option>';
            for(var i=0; i<result.length; i++){
              str += '<option value="'+result[i]['theater_name']+'">'+result[i]['theater_name']+'</option>';
            }
            $('#theater').html(str);
          }
        })
    })
    
    $('#theater').change(function(){//극장을 선택(변경)했을 때
      var param = 'm_code='+$('#title').val()+'&theater_name='+$(this).val();
	  $.ajax({
	    url:'/movie/startBook3',
		data:param,
		success:function(result){
          var str ='<option value="none">영화상영시간을 선택해 주세요</option>';
          for(var i=0; i<result.length; i++){
            str += '<option value="'+result[i]['timetable_code']+'">'
          	       +result[i]['m_name']+', '
          	       +new Date(result[i]['start_time']).getFullYear()+"-"
          	       +(new Date(result[i]['start_time']).getMonth()+1)+"-"//월: +1
          	       +new Date(result[i]['start_time']).getDate()+" "
                   +new Date(result[i]['start_time']).getHours()+":"
                   +new Date(result[i]['start_time']).getMinutes()
          	       +', '+result[i]['screen_name']+'</option>';
	      }
          $('#time').html(str);	  
	    }
      })
    })
  });
</script>
<body>
<jsp:include page="../include/header.jsp" />
<div class="jumbotron">
  <div class="container">
    <h1>예매하기</h1>
  </div>
</div>
<div class="wrapper" style="width: 100%; max-width:1440px; margin: 0 auto; white-space: nowrap;">
<form action="/movie/selectSeat" onsubmit="javascript:return chk()" method="post">
	<select class="custom-select" id="title" name="title" style="width:20%; float: left; margin-right: 10px;">
	  	<option value="none">영화를 선택해 주세요</option>
	  	<c:forEach items="${movieList}" var="movie">
	  		<option value="${movie.m_code}">${movie.m_name}</option>
	  	</c:forEach>
	</select>		
	<select class="custom-select" id="local" name="local" style="width:20%; float: left; margin-right: 10px;">
		<option value="none">지역을 선택해 주세요</option>
	  	<c:forEach items="${areaList}" var="area">
	  		<option value="${area.theater_area}">${area.theater_area}</option>
	  	</c:forEach>
	</select>
	
	<select class="custom-select" id="theater" name="theater" style="width:20%; float: left; margin-right: 10px;">
		<option value="none">극장을 선택해 주세요</option>
	</select>
	
	<select class="custom-select" id="time" name="time" style="width:20%; float: left; margin-right: 10px;">
	<option value="none">영화상영시간을 선택해 주세요</option>
	</select>
	
	<input type="submit" value="좌석 선택" style="padding-bottom: 5px; padding-top: 5px;">
</form>
</div>
<jsp:include page="../include/footer.jsp" />
</body>
<script>
function chk(){
	var time = document.getElementById("time").value;

	if(time=="none"){//상영시간을 선택하지 않았을 때
		alert("모두 선택해 주세요");
		return false;
	}else{
		return true;
	}
}
</script>
</html>