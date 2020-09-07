<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>운영체제 및 스크린 정보</title>
<!--  
<spring:url value="/resources/js/example.js" var="examplejs"/>
<script src="${examplejs }"></script>

-->


<script>
<%--
	var box;
	box=100;
	box=30;
	var tag="<h1>String</h1>"
	var a = true;
	var b = false;
	var c = 10>5;
	var d =Boolean(null);
	
	var t1="수현";
	var t2=" 은성";
	var result;
	result=t1+t2;
	
	
	document.write(box);
	document.write(tag);
	document.write(a,"<br>");
	document.write(b,"<br>");
	document.write(c,"<br>");
	document.write(d,"<br>");
	
	document.write(typeof box,"<br>");
	
	document.write(result);
	
--%>
<%-- 
	var str = "<table border='1'>";
	str += "<tr>";
	str += "<td>1</td><td>2</td><td>3</td>";
	str += "</tr>";
	str += "</table>";
	document.write(str);
--%>
<%--
	var num1 = 10;
	var num2 = 20;
	var result;
	
	num1--;
	document.write(num1,"<br>");
	
	num1++;
	document.write(num1,"<br>");
	
	result = num2++;
	document.write(result,"<br>");
	document.write(num2,"<br>");
	
	result = ++num2;
	document.write(result,"<br>");
	document.write(num2,"<br>");
--%>
<%--
	var height = 161;
	var weight = 47;
	
	var result = (height-100)*0.9;
	document.write("적정 체중은 "+result+"입니다","<br>");
--%>
<%--
	var name = prompt("당신의 이름은 ?","");   //이름 입력
	var height = prompt("당신의 키는? ","0");
	var weight = prompt("당신의 몸무게는?","0");
	
	var normal_w = (height-100)*0.9;
	var result = weight>=normal_w -5 && weight <=normal_w +5;  //오차범위 +-5
	
	if(result == false){
		document.write(name+"님은 적정 체중입니다");
	}else{
		document.write(name+"님은 적정 체중이 아닙니다");
	}
--%>
<%--
	var result = confirm("정말로 회원을 탈퇴하시겠습니까?");
	
	if(result){
		document.write("탈퇴 처리되었습니다!");
	}else{
		document.write("탈퇴 취소되었습니다!");
	}
--%>
<%--
	var id = "soohyunnn";
	var pw = "1234";
	
	var user_id = prompt("아이디는 ? ","");
	var user_pw = prompt("비밀번호는 ? ","");
	
	if(id == user_id){
		if(pw == user_pw){
			document.write(user_id+"님 반갑습니다.");
		}else{
			alert("비밀번호가 일치하지 않습니다");
			location.reload();			//브라우저 새로고침
		}
	}else{
		alert("아이디가 일치하지 않습니다");
		location.reload();
	}
--%>
<%--
	var site = prompt("네이버,다음,네이트,구글 중 즐겨 사용하는 포털 검색 사이트는? ");
	var url;
	
	switch(site){
	case "구글" :url = "www.google.com";
	break;
	case "다음" :url = "www.daum.net";
	break;
	case "네이버" :url ="www.naver.com";
	break;
	case "네이트" :url="www.nate.com";
	break;
	default: alert("보기 중에 없는 사이트입니다.");
	}
	
	if(url)loacation.href = "http://" +url;
--%>
<%--
	var i = 10;
	do{
		document.write("hello","<br>");
		i--;
	}while(i>0)
--%>
<%--
	var tv = new Object();
	tv.color = "white";
	tv.price=300000;
	tv.info = function(){
		document.write("tv 색상 "+this.color,"<br>");
		document.write("tv 가격 "+this.price,"<br>");
	}
	
	var car= {
	color: "black",
	price: 5000000,
	info: function(){
		document.write("car 색상 "+this.color,"<br>");
		document.write("car 가격 "+this.price,"<br>");
		}
	};
	
	document.write("<h1>tv 객체 메서드 호출</h1>");
	tv.info();
	document.write("<h1>car 객체 메서드 호출</h1>");
	car.info();
--%>
<%--
	var today = new Date();
	var nowMonth = today.getMonth(),
	nowDate = today.getDate(),
	nowDay = today.getDay();
	
	document.write("<h1>오늘 날짜 정보</h1>");
	document.write("현재 월: "+nowMonth,"<br>");
	document.write("현재 일: "+nowDate,"<br>");
	document.write("현재 요일: "+nowDay,"<br>");
	
	var worldcup = new Date(2002,4,31);
	var theMonth = worldcup.getMonth(),
	theDate = worldcup.getDate(),
	theDay = worldcup.getDay();
	
	document.write("<h1>월드컵 날짜 정보</h1>");
	document.write("현재 월: "+theMonth,"<br>");
	document.write("현재 일: "+theDate,"<br>");
	document.write("현재 요일: "+theDay,"<br>");
--%>
<%--
	var today = new Date();
	var nowYear = today.getFullYear();
	
	var theDate = new Date(nowYear,12,6);
	var diffDate = theDate.getTime()-today.getTime();	//밀리초로 저장됨
	
	var result = Math.ceil(diffDate/(60*1000*60*24));	//밀리초를 1일단위로 바꿈
	document.write("연말 D-day : "+result+"일 남았습니다");
--%>
<%--
	var num = 2.1234;

	var maxNum = Math.max(10,5,8,30),
	minNum = Math.min(10,5,8,30),
	roundNum = Math.round(num),
	floorNum = Math.floor(num),
	ceilNum = Math.ceil(num),
	rndNum = Math.random(),
	piNum = Math.PI;
	
	document.write(maxNum,"<br>");
	document.write(minNum,"<br>");
	document.write(roundNum,"<br>");
	document.write(floorNum,"<br>");
	document.write(ceilNum,"<br>");
	document.write(rndNum,"<br>");
	document.write(piNum,"<br>");
	
	document.write(Math.random()*10,"<br>");
	document.write(Math.floor(Math.random()*10)+1,"<br>");
--%>	

<%--
	document.write("<h1>컴퓨터 가위,바위,보 맞추기</h1>");
	
	var game = prompt("가위,바위,보 중 선택하세요?","가위");
	var gameNum;
	switch(game){
	case "가위" :
		gameNum = 1;
		break;
	case "바위" :
		gameNum = 2;
		break;
	case "보" :
		gameNum = 3;
		break;
	default: alert("잘못 작성했습니다.");
	location.reload();
	}
	
	var com = Math.ceil(Math.random()*3); //1~3사이에서 난수 발생
	
	if(com==gameNum){
		document.write("<h2>맞췄습니다</h2>");
		document.write("<img src=\"resources/img/elsa.jpg\">");
	}else{
		document.write("<h2>땡땡떙</h2>")
		document.write("<img src=\"resources/img/winter.jpg\">");
	}
--%>
<%--
	//배열 객체 생성
	//방식1
	var d = new Array();
	d[0]=30;
	d[1]="따르릉";
	d[2]=true;
	document.write(d,"<br>");
	
	//방식2
	var d1 = new Array(25,"수현",true);
	document.write(d1,"<br>");
	
	//방식3
	var d3 = [24,"은성",true];
	document.write(d3,"<br>");
	
	//배열 객체에 저장된 데이터 불러오기
	document.write("<h3>배열값 가져오기-1</h3>");
	for(var i = 0;i<d.length;i++){
		document.write(d1[i],"<br>");
	}
	document.write("<h3>배열값 가져오기-2</h3>");
	for(i in d){
		document.write(d3[i],"<br>");
	}
--%>
<%--
	var arr_1 = ["사당","교대","방배","강남"];
	var arr_2 = ["신사", "압구정","옥수"];
	
	var result = arr_1.join("-");
	console.log(result);
	
	result = arr_1.concat(arr_2);
	console.log(result);
	
	result = arr_1.slice(1,3);
	console.log(result);
	
	arr_1.sort();
	console.log(arr_1);
	
	arr_2.reverse();
	console.log(arr_2);
--%>
<%--
	var greenArr = ["교대","방배","강남"];
	var yellowArr = ["미금","정자","수서"];
	
	greenArr.splice(2,1,"서초","역삼");
	console.log(greenArr);
	
	var data1 = yellowArr.pop();
	var data2 = yellowArr.shift();
	
	yellowArr.push(data2);
	console.log(yellowArr);
	
	yellowArr.unshift(data1);
	console.log(yellowArr);
--%>	
<%--
	var t = new String("hello javascript");
	var t1 = "soohyun";
	
	document.write(t,"<br>");
	document.write(t1,"<br>");
	
	var t2 = "Hello Thank you good luck to you";
	document.write(t2.charAt(16),"<br />");
	document.write(t2.indexOf("you"),"<br />");
	document.write(t2.indexOf("you",16),"<br />");
	document.write(t2.lastIndexOf("you"),"<br />");
	document.write(t2.lastIndexOf("you", 25),"<br />");
	document.write(t2.match("luck"),"<br />");
	document.write("<br />");
	document.write(t2.search("you"),"<br />");
	document.write(t2.substr(21,4),"<br />");
	document.write(t2.substring(6,12),"<br />");
	document.write("<br />");
	document.write(t2.replace("you","me"),"<br />");
	document.write(t2.toLowerCase(),"<br />");
	document.write(t2.toUpperCase(),"<br />");
	document.write(t2.length,"<br />");
	
	
	document.write("<br />");
	var s = t2.split(" ");
	document.write(s[0],"<br />");
	document.write(s[4],"<br />");
	
	var str = "A";
	var t2 = str.charCodeAt(0);
	
	document.write(t2,"<br />");
	document.write(String.fromCharCode(65),"<br />");
--%>	
<%--
	var userName = prompt("당신의 영문 이름은??");
	
	var upperName = userName.toUpperCase();
	document.write(upperName,"<br />");
	
	var userNum = prompt("당신의 전화번호는??");
	var result = userNum.substring(0,userNum.length-4)+"****";
	document.write(result,"<br />");
--%>
<%--
	var userEmail = prompt("당신의 이메일 주소는??","");
	var arrUrl = [".co.kr",".com",".net",".or.kr",".go.kr"];
	
	var check1 = false;
	var check2 = false;
	
	if(userEmail.indexOf("@")>0){
		check1 = true;
	}
	
	for(var i = 0 ;i<arrUrl.length; i++){
		if(userEmail.indexOf(arrUrl[i])>0){
			check2 = true;
		}
	}
	
	if(check1 && check2){
		document.write(userEmail);
	}else{
		alert("이메일 형식이 잘못되었습니다.");
	}
--%>
<%--	
	window.open("http://www.easypub.com/","easypub","width=350,height=400,left=50,top=10,scrollbars=no");
--%>

<%--	
	
	window.open("hello.jsp","pop1","width=300,height=400,left=300,top=50");
--%>
<%--
	var addNum = 0;
	var subNum = 1000;
	
	var auto_1 = setInterval(function(){
		addNum++;
		console.log("addNum: "+ addNum);
	}, 3000);
	
	var auto_2 = setInterval(function(){
		subNum--;
		console.log("subNum: "+subNum);
	}, 3000);
--%>
<%--
	var addNum = 0;
	var auto = setTimeout(function(){
		addNum++;
		console.log("addNum: "+addNum);
	}, 5000);
--%>
<%--	
	var info = navigator.userAgent.toLowerCase();
	var osImg = null;
	
	if(info.indexOf('windows') >= 0) {
		osImg = "windows.png";
	} else if(info.indexOf('macintosh') >= 0) {
		osImg = "macintosh.png";
	} else if (info.indexOf('iphone') >= 0) {
		osImg = "iphone.png";
	} else if (info.indexOf('android') >= 0) {
		osImg = "android.png";
	}
	
	document.write("<img src=\"resources/img/" + osImg + "\">", "<br>");
	var scr = screen;
	var sc_w = scr.width;
	var sc_h = scr.height;
	
	document.write("모니터 해상도 너비:" + sc_w + "px", "<br>");
	document.write("모니터 해상도 높이:" + sc_h + "px", "<br>");
--%>
<%--	
	var phoneNum = "010-2345-1234";
	var result_1 = phoneNum.substring(0,9);
	document.write(result_1,"****<br>");
	
	var imgSrc = "images/but_out.jpg";
	var result_2 = imgSrc.replace("out","over");
	document.write(result_2,"<br>");
	
	var menu = ["짜장면","돈가스","된장국","김치찌개","회덮밥"];
	var menuNum = Math.floor(Math.random()*5);
	var result = menu[menuNum];
	document.write(result);
--%>
<%--	
	var count = 0;
	
	myFnc();		//함수 호출문이 먼저 나와도 호이스팅 방식이 적용되어 정상적으로 함수 호출
	
	function myFnc(){
		count++;
		document.write("hell0"+count,"<br>");
	}
	
	myFnc();
	
	var theFnc = function(){
		count++;
		document.write("bye"+count,"<br>");
	}
	
	theFnc();
--%>
<%--	
	var color = ["white","yellow","aqua","purple"];
	
	var i = 0;
	function changeColor(){
		i++;
		if(i>=color.length){
			i=0;
		}
	
	
	var bodyTag =document.getElementById("theBody");
	bodyTag.style.backgroundColor=color[i];

	}
--%>
<%--
	function myFnc(name, area){
		document.write("안녕하세요 "+name+"입니다","<br>");
		document.write("사는 곳은 "+area+"입니다","<br><br>");
	}

	myFnc("수현","인천 서구 마전동");
	
	myFnc("은성","인천 서구 심곡동");
--%>
<%--
	var rightId = "korea";
	var rightPw = "1234";
	function login(id,pw){
		if(id == rightId){
			if(pw == rightPw){
				document.write(id+"님 방문을 환영합니다");
			}else{
				alert("잘못된 비밀번호입니다.");
			}
			
		}else{
			alert("존재하지 않는 아이디입니다.");
		}
	}
	var userId = prompt("아이디를 입력하세요.");
	var userPw = prompt("패스워드를 입력하세요.");
	
	login(userId,userPw);
--%>
<%--
	function sum(){
		var sum = arguments[0]+arguments[1]+arguments[2];
		
		document.write(sum);
	}
	sum(10,20,30);
	
	document.write("<br>");
	
	function sum1(){
		var sum=0;
		for(var i =0;i<arguments.length;i++){
			sum += arguments[i];
		}
		
		document.write(sum);
	}
	sum(10,20,30);
--%>
<%--	
	function testAvg(arrDate){
		var sum = 0;
		for(var i =0;i<arrDate.length;i++){
			sum += Number(prompt(arrDate[i]+"점수는?","0"));
		}
		var avg = sum / arrDate.length;
		return avg;
	}
	
	var arrSubject=["국어","수학"];
	var result = testAvg(arrSubject);
	
	document.write("평균 점수는 "+result+"점입니다");
--%>

<%--
	var num = 1;
	function gallery(direct){
		if(direct){
			if(num == 8)return;
			num++;
		}else{
			if(num == 1) return;
			num--;
		}
		
		var imgTag = document.getElementById("photo");
		imgTag.setAttribute("src", "resources/img/pic_"+num+".jpg");
	}
--%>
<%--
	var num = 0;
	function testFnc(){
		num++;
		document.write(num,"<br>");
		if(num==10)return;
		
		testFnc();
	}
	
	testFnc();
--%>
<%--
	function myFnc(){
		alert("전역 함수");
	}
	
	function outerFnc(){
		function myFnc(){
			alert("지역 함수");
		}
		myFnc();
	}

	outerFnc();
	myFnc();
--%>
<%--
	(function(){
		
	var num = 100;
	function menu(){
		num += 100;
		alert(num);
	}
	menu();
	}());
	
	(function(){
		var num = 100;
		function menu(){
			alert(num);
		}
	}());
--%>
<%--
	function CheckWeight(name,height,weight){
		this.userName = name;
		this.userHeight = height;
		this.userWeight = weight;
		this.minWeight;
		this.maxWeight;
	
	
		this.getInfo = function(){
			var str=""
			str += "이름 : "+this.userName+",";
			str += "키: "+this.userHeight+",";
			str += "몸무게: "+this.userWeight+"<br>";
			return str;
		}
		this.getResult = function(){
			this.midWeight = (this.userHeight - 100)*0.9-5;
			this.maxWeight = (this.userHeight - 100)*0.9+5;
			
			if(this.userWeight >= this.minWeight && this.userWeight <= this.maxWeight){
				return "정상 몸무게입니다";
			}else if(this.userWeight < this.minWeight){
				return "정상 몸무게보다 미달입니다";
			}else{
				return "정상 몸무게보다 초과입니다";
			}
		}
	
	}
	var soo = new CheckWeight("최수현", 161, 47);
	var yeom = new CheckWeight("염은성", 178, 80);
	console.log(soo);
	console.log(yeom);
	
	document.write(soo.getInfo());
	document.write(soo.getResult());
--%>
<%--
	function CheckWeight(name,height,weight){
		this.userName = name;
		this.userHeight = height;
		this.userWeight = weight;
		this.minWeight;
		this.maxWeight;
	}
	CheckWeight.prototype.getInfo = function(){
		var str=""
			str += "이름 : "+this.userName+",";
			str += "키: "+this.userHeight+",";
			str += "몸무게: "+this.userWeight+"<br>";
			return str;
	}
	CheckWeight.prototype.getResult = function(){
		this.midWeight = (this.userHeight - 100)*0.9-5;
		this.maxWeight = (this.userHeight - 100)*0.9+5;
		
		if(this.userWeight >= this.minWeight && this.userWeight <= this.maxWeight){
			return "정상 몸무게입니다";
		}else if(this.userWeight < this.minWeight){
			return "정상 몸무게보다 미달입니다";
		}else{
			return "정상 몸무게보다 초과입니다";
		}
	}
	var soo = new CheckWeight("최수현", 161, 47);
	var yeom = new CheckWeight("염은성", 178, 80);
	console.log(soo);
	console.log(yeom);
	
	document.write(soo.getInfo());
	document.write(soo.getResult(),"<br>");
	
	document.write(soo.getResult===yeom.getResult);
--%>
<%--
	function chColor(){
		var arrColor = ["#ff0","#6c0","#fcf","#cf0","#39f"];
		var arrNum = Math.floor(Math.random()*5);
		
		var bodyTag = document.getElementById("theBody");
		bodyTag.style.backgroundColor=arrColor[arrNum];
	}
--%>

	function TestScore(name,kor,eng){
		this.userName = name;
		this.korNum = kor;
		this.engNum = eng;
		
	}
	TestScore.prototype.getTestInfo = function(){
		document.write("이름:"+this.userName,"<br>");
		document.write("국어:"+this.korNum,"<br>");
		document.write("영어:"+this.engNum,"<br>");
	}
	
	TestScore.prototype.getAvg = function(){
		return (this.korNum+this.engNum)/2;
	}
	
	var kimgun = new TestScore("김군", 80, 90);
	var ohgun = new TestScore("오군", 100, 80);
	
	kimgun.getTestInfo();
	document.write("평균 점수:"+kimgun.getAvg(),"<br><br>");
	
	ohgun.getTestInfo();
	document.write("평균 점수:"+ohgun.getAvg(),"<br>");

</script>
</head>
<body>
<!--  
<p>
	<img src="resources/img/winter.jpg" usemap="#intro" alt="신간 책 소개">
	<map name="intro" id="intro">
		<area shape="rect" coords="230,368,280,390" href="#" alt="창 닫기" onclick="window.close();">
	</map>
</p>
-->
 <!--
	<h1>일정 시간 간격으로 값 증감시키기</h1>
	
	<h3>콘솔 패널을 열어 확인하세요.</h3>
 	
	<button onclick="clearInterval(auto_1)">증가 정지</button>
	<button onclick="clearInterval(auto_2)">감소 정지</button>
-->	

<!--
	<body id="theBody">
		<button onclick="changeColor();">배경색 바꾸기</button>
-->	
<!--  
	<div id="galleryZone">
		<p><img src ="resources/img/pic_1.jpg" id="photo" alt=""> </p>
		<p>
			<button onclick="gallery(0)">이전</button>
			<button onclick="gallery(1)">다음</button>
		</p>
	</div>
-->
<!-- 
	<body id="theBody">
		<button onclick="chColor();">배경 색 바꾸기</button>
-->	

</body>
</html>