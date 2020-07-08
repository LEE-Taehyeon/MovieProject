<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영시간표 추가창</title>
<!-- CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<!-- JS -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- 달력나타내기(공부 좀 더 하기) -->
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script>
$(function(){
    $('#theater_area').change(function(){//지역을 선택해서 해당 영화관 출력
        var param ='theater_area='+ $(this).val();
          $.ajax({
            url:'/movie/TimetableInsertForm2',
            data:param,
            success:function(result){
              var str ='<option value="none">극장을 선택해 주세요</option>';
              for(var i=0; i<result.length; i++){
                str += '<option value="'+result[i]['theater_name']+'">'+result[i]['theater_name']+'</option>';
              }
              $('#theater_nameA').html(str);
            }
          })
      })
      
    $('#theater_nameA').change(function(){//영화관 선택해서 해당 상영관 출력
        var param ='theater_name='+ $(this).val();
          $.ajax({
            url:'/movie/TimetableInsertForm3',
            data:param,
            success:function(result){
            	
              var str ='<option value="none">상영관을 선택해 주세요</option>';
              for(var i=0; i<result.length; i++){
                str += '<option value="'+result[i]['theater_code']+'">'+result[i]['screen_name']+'</option>';
              }
              $('#screen_nameA').html(str);
            }
          })
    	$('#theater_name').val($("#theater_nameA option:selected").text());//선택한 극장 이름 가져오기
      })
      
	$('#screen_nameA').change(function(){
		$('#screen_name').val($("#screen_nameA option:selected").text());//선택한 상영관 이름 가져오기
	})
		

	$(function(){
		$(".datepicker").datepicker({
			dateFormat: "yy-mm-dd",//텍스트 필드에 입력되는 날짜 형식
			prevText: "이전달",
			nextText: "다음달",
			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],// 월의 한글형식
			dayNamesMin: ['일','월','화','수','목','금','토'],//요일의 한글 형식
			changeMonth: true,//월을 바꿀 수 있는 셀렉트 박스를 표시한다
			changeYear: true,//년을 바꿀 수 있는 셀렉트 박스를 표시한다
			showMonthAfterYear: true,//월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다
			yearRange: "c-100:c"
		});
	});

});

function timetableList(){
	var theater_area = document.getElementById('theater_area').value;
	var theater_nameA = document.getElementById('theater_nameA').value;
	var screen_nameA = document.getElementById('screen_nameA').value;
	var theater_code = document.getElementById('screen_nameA').value;
	var screening_date = document.getElementById('date').value;
	
	var param = 'theater_code=' + theater_code+'&screening_date='+screening_date;
	
	if(theater_area=="none"){
		alert('지역을 선택하세요');
		return false;
	}else if(theater_nameA=="none"){
		alert('영화관을 선택하세요');
		return false;
	}else if(screen_nameA=="none"){
		alert('상영관을 선택하세요');
		return false;
	}else if(screening_date==""){
		alert('날짜를 선택하세요');
		return false;
	}else{
		$.ajax({
			url : '/movie/FindTimetableList',
			data : param,
			success : function(result) {
				var str = '<table>';
				str+='<tr><td>순번</td><td>영화</td><td>영화 포스터</td><td>상영 시작시간</td><td>상영 종료시간</td></tr>';
				if(result.length!=0){
					for (var i = 0; i < result.length; i++) {
						str += '<tr><td>'+(i+1)+'</td><td>'+result[i]['m_name']+'</td><td>'
						+result[i][m_poster]+'</td><td>'+result[i]['start_time']+'</td><td>'+result[i]['end_time']+'</td></tr>';
					}
					str+='</table>';
				}else{
					str+='</table>';
					str+='등록된 상영시간표가 없습니다.';
				}
				$('#timetableList').html(str);
			}
		});
	}		
}

function endTimeCal(){
	var movie_code = document.getElementById('m_code').value;
	var start_time = document.getElementById('time').value;
	var param = 'm_code='+movie_code;
	var end_time = 0;
	
	if(start_time==""){
		alert('상영 시작시간을 입력하세요.');
	}else{
		var arr = start_time.split(':');
		
		$.ajax({
			url : '/movie/CalEndTime',
			data : param,
			success : function(result) {
				var hour = Math.floor(result/60);
				var minute = result%60;
				var totalMinute = +arr[1]+minute;

				if(totalMinute>=60){
					hour += Math.floor(totalMinute/60);
					totalMinute %= 60;
				}
				if(totalMinute<10){
					totalMinute = '0'+totalMinute;
				}
				end_time = +arr[0]+hour+":"+totalMinute;
				alert(end_time);
				document.getElementById('endTime').value = end_time;
			}
		});
	}
}
</script>
</head>
<body>
	<jsp:include page="../include/header.jsp" />
	<%
		int num1 = (int) (Math.random() * 90) + 10;
		int num2 = (int) (Math.random() * 90) + 10;
		int num3 = (int) (Math.random() * 90) + 10;

		String t_Code = "T" + num1 + num2 + num3;
	%>
	
	<div class="jumbotrons">
		<div class="container">
			<h3 class="display-3">상영시간표 등록</h3>
		</div>
	</div>
	
	<div class="container">
		<form action="/movie/TimetableInsert"  onsubmit="return chk()" name="fr" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2">상영시간표코드</label>
				<div class="col-sm-3">
					<input type="text" name="timetable_code" id="timetable_code" class="form-control" value="<%=t_Code %>" readonly required>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">지역</label>
				<div class="col-sm-3">
				<select id="theater_area" name="theater_area"  class="custom-select">
					<option value="none">지역을 선택해 주세요</option>
				  	<c:forEach items="${areaList}" var="area">
				  		<option value="${area.theater_area}">${area.theater_area}</option>
				  	</c:forEach>
				</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">영화관</label>
				<div class="col-sm-3">
					<select class="custom-select" id="theater_nameA" name="theater_nameA" required>
						<optgroup label="영화관"></optgroup>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">상영관</label>
				<div class="col-sm-3">
					<select id="screen_nameA" name="screen_nameA" class="custom-select" required>
						<optgroup label="상영관"></optgroup>
					</select>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">날짜</label>
				<div class="col-sm-3">
					<input type="text" name="date" id="date" class="datepicker form-control" required>
					<input type="button" onclick="timetableList()" value="상영시간표 조회">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2">영화</label>
				<div class="col-sm-3">
						<select id="m_code" name="m_code" class="custom-select" required>
							<optgroup label="영화"></optgroup>
                            <c:forEach items="${movieList}" var="movie">
	  		                	<option value="${movie.m_code}">${movie.m_name}</option>
	  	                    </c:forEach>
						</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">영화 상영시간</label>
				<div class="col-sm-3">
					<input type="time" id="time" name="time" min="06:00" required>~
					<input type="time" id="endTime" name="endTime" required readonly>
					<button type="button" onclick="endTimeCal()">상영시간 계산</button>
					<button type="button" onclick="timetable_chk()">상영시간표 체크</button>
				</div>
			</div>
			<!-- hidden -->
			<input type="hidden" id="theater_name" name="theater_name">
			<input type="hidden" id="screen_name" name="screen_name">
			<!--  -->
			
			<input type="submit" class="btn btn-primary" value="상영시간표 등록">
			<a href="TimetableListAction.do?pageNum=1" class="btn btn-info">되돌아가기</a>
		</form>
	</div>
	<div id="timetableList">

	</div>
	
	<jsp:include page="../include/footer.jsp" />
</body>
<script>
	function chk() {
		var screen = document.getElementById("screen_code").value;

		if (screen == "none") {//상영관을 선택하지 않았을 때
			alert("모두 선택해 주세요");
			return false;
		} else {
			var yN = confirm('상영시간표를 등록하시겠습니까?');
			if (yN) {
				alert('상영시간표가 등록되었습니다.');
				return true;
			}
		}
	}
</script>
</html>








