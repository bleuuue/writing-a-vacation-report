<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type='text/javascript'>
	
function reg_sub(){
		
	var syear = document.getElementById("DayOffSYear").options[document.getElementById("DayOffSYear").selectedIndex].text;
	syear = Number(syear);
	var smonth = document.getElementById("DayOffSMonth").options[document.getElementById("DayOffSMonth").selectedIndex].text;
	smonth = Number(smonth);
	var sday = document.getElementById("DayOffSDay").options[document.getElementById("DayOffSDay").selectedIndex].text;
	sday = Number(sday);
	
	var eyear = document.getElementById("DayOffEYear").options[document.getElementById("DayOffEYear").selectedIndex].text;
	eyear = Number(eyear);
	var emonth = document.getElementById("DayOffEMonth").options[document.getElementById("DayOffEMonth").selectedIndex].text;
	emonth = Number(emonth);
	var eday = document.getElementById("DayOffEDay").options[document.getElementById("DayOffEDay").selectedIndex].text;
	eday = Number(eday);
	
	var sdayoff = 0;
	var edayoff = 0;
	
	

	<!-- 휴가 시작-->
	if(sdayoff == 0){
		if(smonth==2){
			if(sday>28){
				alert("휴가 시작 일수를 잘못입력하였습니다.");
			}else edayoff=1;
		}
		
		var montharr = [4, 6, 9, 11];
		
		for(var i=0; i<montharr.length; i++){
			if(montharr[i]==smonth){
				if(sday>30){
					alert("휴가 시작 일수를 잘못입력하였습니다.");
				}else edayoff=1;
			}
		}//for out
	}//startdate
	

	<!-- 휴가 끝-->
	if(edayoff == 0){
		if(emonth==2){
			if(eday>28){
				alert("휴가 종료 일수를 잘못입력하였습니다.");
			}else edayoff=1;
		}
		
		var montharr = [4, 6, 9, 11];
		
		for(var i=0; i<montharr.length; i++){
			if(montharr[i]==emonth){
				if(eday>30){
					alert("휴가 종료 일수를 잘못입력하였습니다.");
				}else edayoff=1;
			}
		}//for out
	}//end date
	
	var start_Date;
	var end_Date;
	
	if (smonth<10){
		start_Date = String(syear) + "0" +String(smonth) + String(sday);
	} else start_Date = String(syear) + String(smonth) + String(sday);
	if (sday<10){
		start_Date = String(syear) + String(smonth) + "0" + String(sday);
	} else start_Date = String(syear) + String(smonth) + String(sday);
	
	if(smonth<10 && sday<10){
		start_Date = String(syear) + "0" +String(smonth) + "0" + String(sday);
	} else start_Date = String(syear) + String(smonth) + String(sday);
	
	document.getElementById("start_Date").value = start_Date;
	
	if (emonth<10){
		end_Date = String(eyear) + "0" +String(emonth) + String(eday);
	}else end_Date = String(eyear) + String(emonth) + String(eday);
	if (eday<10){
		end_Date = String(eyear) + String(emonth) + "0" + String(eday);
	}else end_Date = String(eyear) + String(emonth) + String(eday);
	
	if(emonth<10 && eday<10){
		end_Date = String(eyear) + "0" +String(emonth) + "0" + String(eday);
	} else end_Date = String(eyear) + String(emonth) + String(eday);
	
	document.getElementById("end_Date").value = end_Date;

	
	
	
}//function out
	

</script>
<style>
    .select_td{
    	text-align: center;
    }

    
</style>

</head>
<body>
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>

   <center>
      <p style="display: inline; border: 1px solid #444444; margin-bottom: 5px;"><!-- 오늘의 년과 달 출력 -->
         &nbsp;2019年
         7月&nbsp;
      </p>
   </center>

<fieldset>
	<form id="get_memeberInfoForm_${membersData.id}"
						action="G14" method="POST">
						<input type="hidden" name="id" id="id" value=${membersData.id}>
						<input type="hidden" name="start_Date" id="start_Date" value=${membersData.id}>
						<input type="hidden" name="end_Date" id="end_Date" value=${membersData.id}>
	<table style="margin: 0 auto; position: relative; padding: 30px;">
	
		<tr>
			<td>区分</td>
			<td class="select_td">
				<select name="dayoff_div" id="dayoff_div">
					<option value="1">연차</option>
					<option value="2">반차</option>
					<option value="3">경조사</option>
					<option value="4">여름휴가</option>
					<option value="5">장기휴가</option>
				</select>
			</td>
			
		</tr>
		
		
		
		<tr>
			<td><p></p></td>
			<td style="text-align: center;">年度</td>
			<td style="text-align: center;">月</td>
			<td style="text-align: center;">日</td>
		</tr>
		<tr>
			<td>휴가시작</td>
			<td class="select_td">
				<select id="DayOffSYear">
                    <option value="2018">2018</option>
					<option selected value="2019">2019</option>
					<option value="2020">2020</option>
				</select>
			</td>
			<td class="select_td">
				<select id="DayOffSMonth">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
			</td>
			<td class="select_td">
				<select id="DayOffSDay">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
			</td>
		</tr>
		

		<tr>
			<td>휴가종료</td>
			<td class="select_td">
				<select id="DayOffEYear">
                    <option value="2018">2018</option>
					<option selected value="2019">2019</option>
					<option value="2020">2020</option>
				</select>
			</td>
			<td class="select_td">
				<select id="DayOffEMonth">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
				</select>
			</td>
			<td class="select_td">
				<select id="DayOffEDay">
					<option value="01">01</option>
					<option value="02">02</option>
					<option value="03">03</option>
					<option value="04">04</option>
					<option value="05">05</option>
					<option value="06">06</option>
					<option value="07">07</option>
					<option value="08">08</option>
					<option value="09">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select>
			</td>
		</tr>
		

		<tr></tr> <!-- 공백을 위한 null 값 -->
		
		<tr>
			<td>細部事項</td>
		</tr>
		<tr>
			<td scope="rowgroup" colspan="4">
				<textarea name="reason" id="reason" rows="8" cols="40%" style="resize: none;"></textarea>
			</td>
		</tr>
        <tr>
            <td><input type="button" value="돌아가기" style="width: 70px;" onclick="history.back(-1)"/></td>
            <td></td>
            <td></td>
            <td style="text-align: right;"><input type="submit" value="제출" style="width: 70px;" onclick="reg_sub()"/></td>
        </tr>
        
	</table>
    </form>
</fieldset>
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
</body>
</html>