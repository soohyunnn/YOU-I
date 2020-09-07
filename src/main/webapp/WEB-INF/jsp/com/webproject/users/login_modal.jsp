<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>


    $(document).ready(function() {
 
        
       // alert("오잉");
        
      //로그인 처리
        $("#btnLogin").click(function() {
 
        	var signInData = {
    	            userId :$('#signInId').val(),
    	            userPw :$('#signInPw').val(),
    	            	
    	        };
    		console.log(signInData);
 
    		//입력 값 체크
    		if($.trim($('#signInId').val()) == ''){
    			alert("아이디를 입력해 주세요.");
    			$('#userId').focus();
    			return;
    		}else if($.trim($('#signInPw').val()) == ''){
    			alert("패스워드를 입력해 주세요.");
    			$('#passwd').focus();
    			return;
    		}
 
            //비동기 ajax 방식으로 데이터 주고 받기 방법
            
            $.ajax({
            	
                type : "post",
                data :signInData,
                url : "loginCheck.do",
                success : function(data) {
                	console.log("data", data);
                	console.log("data.loginresultMap", data.loginresultMap);
                	console.log("data.loginresultMap.result", data.loginresultMap.result);
                	console.log("data.loginresultMap.loginCheck", data.loginresultMap.loginCheck);
                	console.log("data.loginresultMap.loginCheck.userName", data.loginresultMap.loginCheck.userName);
                	alert("로그인에 성공하였습니다");
        			location.href ="${pageContext.request.contextPath}/";
 
                }
 
            });

        });
      
        $('.modal').on('hidden.bs.modal', function (e) {
            $(this).find('form')[0].reset()
            location.reload();
           // location.href ="${pageContext.request.contextPath}/";
        });

        
      
      
 
    });
    
    

 
</script>

<!-- 로그인 Modal-->
<div class="modal fade" id="log-in">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #ff52a0;">YOU & I</span> 로그인
				</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">

				<form action="" name="izone-sign-in" method="post" id="loginFrm"
					style="margin-bottom: 0;">
					<table style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idCheck"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userId" id="signInId" value="sss"
								class="form-control tooltipstered" maxlength="10"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="최대 10자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwCheck"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="signInPw" value="qweasd12!@"
								name="userPw" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="최소 8자"></td>
						</tr>
						<tr>
							<td style="padding-top: 10px; text-align: center">
								<p><strong>로그인하셔서 YOU & I가 되어보세요~~!</strong></p>
							</td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="로그인" class="btn form-control tooltipstered" id="btnLogin" 
								style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #f78f24; opacity: 0.8">
							</td>
						</tr>
						<tr>
							<td
								style="width: 100%; text-align: center; colspan: 2; margin-top: 24px; padding-top: 12px; border-top: 1px solid #ececec">

								<a class="btn form-control tooltipstered" data-toggle="modal"
								href="#sign-up"
								style="cursor: pointer; margin-top: 0; height: 40px; color: white; background-color: orange; border: 0px solid #388E3C; opacity: 0.8">
									회원가입</a>
							</td>
						</tr>
					</table>
				</form>
				
			</div>
		</div>
	</div>
</div>

<!-- 회원가입 Modal -->
<div class="modal fade" id="sign-up" role="dialog">
	<div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">
					<span style="color: #ff52a0;">YOU & I</span> 회원 가입
				</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>

			</div>

			<div class="modal-body">

				<form action="/izone/users/join_ok.jsp" name="signup" id="joinFrm" method="post"
					style="margin-bottom: 0;">
					<table
						style="cellpadding: 0; cellspacing: 0; margin: 0 auto; width: 100%">
						<tr>
							<td style="text-align: left">
								<p><strong>아이디를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="idChk"></span></p>
							</td>
								
							
						</tr>
						<tr>
							<td><input type="text" name="userId" id="user_id" 
								class="form-control tooltipstered" maxlength="14"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="숫자와 영어로 4-10자">
								</td>
							
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="password" 
								name="userPw" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="영문과 특수문자를 포함한 최소 8자"></td>
						</tr>
						<tr>
							<td style="text-align: left">
								<p><strong>비밀번호를 재확인해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="pwChk2"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="password" size="17" maxlength="20" id="password_check"
								name="pw_check" class="form-control tooltipstered" 
								maxlength="20" required="required" aria-required="true"
								style="ime-mode: inactive; margin-bottom: 25px; height: 40px; border: 1px solid #d9d9de"
								placeholder="비밀번호가 일치해야합니다."></td>
						</tr>

						<tr>
							<td style="text-align: left">
								<p><strong>이름을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="nameChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="text" name="userName" id="user_name"
								class="form-control tooltipstered" maxlength="6"
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="한글로 최대 6자"></td>
						</tr>
						
						<tr>
							<td style="text-align: left">
								<p><strong>이메일을 입력해주세요.</strong>&nbsp;&nbsp;&nbsp;<span id="emailChk"></span></p>
							</td>
						</tr>
						<tr>
							<td><input type="email" name="userEmail" id="user_email"
								class="form-control tooltipstered" 
								required="required" aria-required="true"
								style="margin-bottom: 25px; width: 100%; height: 40px; border: 1px solid #d9d9de"
								placeholder="ex) OOO@naver.com"></td>
						</tr>

						<tr>
							<td style="padding-top: 10px; text-align: center">
								<p><strong>회원가입하셔서 YOU & I이 되어보세요~~!</strong></p>
							</td>
						</tr>
						<tr>
							<td style="width: 100%; text-align: center; colspan: 2;"><input
								type="button" value="회원가입" 
								class="btn form-control tooltipstered" id="signup-btn"
								style="background-color: #ff52a0; margin-top: 0; height: 40px; color: white; border: 0px solid #388E3C; opacity: 0.8">
							</td>
						</tr>

					</table>
				</form>
			</div>
		</div>
	</div>
</div>


<!-- 입력값 검증 자바 스크립트 코드 -->

<script type="text/javascript">

 

//JQuery라이브러리 사용

 

//JQUERY코드의 시작

$(document).ready(function() {

	

	//자바스크립트 정규 표현식

	const getIdCheck= RegExp(/^[a-zA-Z0-9]{3,14}$/);

	const getPwCheck= RegExp(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~])|([!,@,#,$,%,^,&,*,?,_,~].*[a-zA-Z0-9])/);

	const getName= RegExp(/^[가-힣]/);

	const getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);

	

	//입력창을 제대로 입력했는지를 판별할 논리 변수들

	let chk1 = false, chk2 = false, chk3 = false, chk4 = false, chk5 = false;

	

	//회원가입 입력값 검증

	//ID 입력값 검증
	
	
	
	//ID입력창 키보드 입력 이벤트 함수 만들기
	$("#user_id").on("keyup", function() {	

		

		

		//val()이라는 함수는 input창에 입력한 데이터를 리턴합니다.		

		//console.log($(this).val());

		

		const idInput = $(this);

		

		if(idInput.val() === "") {

			//css함수는 디자인을 변경시키는 함수.

			idInput.css("background-color", "pink"); 

			$("#idChk").html("<b style='color:red;'>[아이디는 필수 정보에요!]</b>");

			chk1 = false;

		} else if(!getIdCheck.test(idInput.val())) {

			idInput.css("background-color", "pink"); 

			$("#idChk").html("<b style='color:red;'>[아이디 다시 입력 해죠!]</b>");

			chk1 = false;
			
			

		} else {

			

			/*

				# ID중복확인 비동기 통신 처리

				- 비동기 통신은 페이지를 새로고침하지 않고 화면을 유지시키면서

				 서버와 실시간으로 통신하는 기술입니다.

			*/

			$.ajax({

				type : "POST", //http요청 메서드

				url : "duplicateIdCheck.do",

				data : { userId :$('#user_id').val() }, //통신시에 서버쪽으로 전달할 데이터

				//통신을 성공적으로 수행했을 때 클라이언트가 해야할 행동을 

				//함수로 기술합니다.

				//통신이 성공하면 서버에서 전달해주는 데이터가 result에 저장됩니다.

				success : function(result) {

					//console.log("통신 성공!!");

					//제이쿼리의 문자열 공백제거함수  $.trim()

					//console.log($.trim(result));

					

					if($.trim(result) === "NO") {

						//$("#idChk").html("<b style='color: green;'>[아이디 사용 가능!]</b>")
						
						$("#idChk").html("<b style='color: green;'>[아이디 입력 잘해따!]</b>")

						idInput.css("background-color", "aqua");

						chk1 = true;

					} else {

						$("#idChk").html("<b style='color: green;'>[아이디 입력 잘해따!]</b>")

						idInput.css("background-color", "aqua");

						chk1 = false;

					}

					

				}

			});//비동기 통신을 수행하는 함수

			

		}

		

	});//아이디 keyup이벤트함수 종료
	


	

	//패스워드 입력값 검증.

	$('#password').on('keyup', function() {

		//비밀번호 공백 확인

		if($("#password").val() == ""){

		    $('#password').css("background-color", "pink");

			$('#pwChk').html('<b style="font-size:16px;color:red;">[패스워드는 필수정보에요!]</b>');

			chk2 = false;

		}		         

		//비밀번호 유효성검사

		else if(!getPwCheck.test($("#password").val()) || $("#password").val().length < 8){

		    $('#password').css("background-color", "pink");

			$('#pwChk').html('<b style="font-size:16px;color:red;">[비밀번호 입력해주세요!]</b>');

			chk2 = false;

		} else {

			$('#password').css("background-color", "aqua");

			$('#pwChk').html('<b style="font-size:16px;color:green;">[참 잘했어요~♡]</b>');

			chk2 = true;

		}

		

	});

	

	//패스워드 확인란 입력값 검증.

	$('#password_check').on('keyup', function() {

		//비밀번호 확인란 공백 확인

		if($("#password_check").val() === ""){

		    $('#password_check').css("background-color", "pink");

			$('#pwChk2').html('<b style="font-size:16px;color:red;">[패스워드확인은 필수정보에요!]</b>');

			chk3 = false;

		}		         

		//비밀번호 확인란 유효성검사

		else if($("#password").val() != $("#password_check").val()){

		    $('#password_check').css("background-color", "pink");

			$('#pwChk2').html('<b style="font-size:16px;color:red;">[위에랑 똑같이 제대로 써죠!!]</b>');

			//chk3 = false;

		} else {

			$('#password_check').css("background-color", "aqua");

			$('#pwChk2').html('<b style="font-size:16px;color:green;">[참 잘했어요~♡]</b>');

			chk3 = true;

		}

		

	});

	

	//이름 입력값 검증.

	$('#user_name').on('keyup', function() {

		//이름값 공백 확인

		if($("#user_name").val() == ""){

		    $('#user_name').css("background-color", "pink");

			$('#nameChk').html('<b style="font-size:16px;color:red;">[이름은 필수정보에요!]</b>');

			chk4 = false;

		}		         

		//이름값 유효성검사

		else if(!getName.test($("#user_name").val())){

		    $('#user_name').css("background-color", "pink");

			$('#nameChk').html('<b style="font-size:16px;color:red;">[이름도 적어주세용!]</b>');

			chk4 = false;

		} else {

			$('#user_name').css("background-color", "aqua");

			$('#nameChk').html('<b style="font-size:16px;color:green;">[참 잘했어요~♡]</b>');

			chk4 = true;

		}

		

	});

	

	//이메일 입력값 검증.

	$('#user_email').on('keyup', function() {

		//이메일값 공백 확인

		if($("#user_email").val() == ""){

		    $('#user_email').css("background-color", "pink");

			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일은 필수정보에요!]</b>');

			chk5 = false;

		}		         

		//이메일값 유효성검사

		else if(!getMail.test($("#user_email").val())){

		    $('#user_email').css("background-color", "pink");

			$('#emailChk').html('<b style="font-size:16px;color:red;">[이메일 형식 몰라?]</b>');

			chk5 = false;

		} else {

			$('#user_email').css("background-color", "aqua");

			$('#emailChk').html('<b style="font-size:16px;color:green;">[참 잘했어요~♡]</b>');

			chk5 = true;

		}

		

	});

	

	//회원가입 버튼 클릭 이벤트 처리

	$('#signup-btn').click(function(e) {
		
		var memberData = {
	            userId :$('#user_id').val(),
	            userPw :$('#password').val(),
	            userName :$('#user_name').val(),
	            userEmail :$('#user_email').val()
	            	
	        };
		console.log(memberData);
		
	
        //새로운 회원 정보 저장
		$.ajax({
			type : "POST", //http요청 메서드
			url : "duplicateIdCheck.do",
			data : memberData, //통신시에 서버쪽으로 전달할 데이터
			success : function(result) {
				if(result.resultMap.duplicateYn === "Y") {
					alert("존재하는 아이디 입니다.");
				} else {
					//새로운 회원 정보 저장
			        $.ajax({
			            type: "post",
			            url: "memberJoin.do",
			            data: memberData,
			            success: function (data) {
			            	console.log("data", data);
			            	console.log("data.resultMap", data.resultMap);
			            	console.log("data.resultMap.result", data.resultMap.result);
			            	if(data.resultMap.result === "success") {
			            		alert("등록에 성공하였습니다");
			            		location.href ="${pageContext.request.contextPath}/";
			            		//DB연동시 중복이벤트 방지를 위한
			                   // $('#calendar').fullCalendar('removeEvents');
			                   // $('#calendar').fullCalendar('refetchEvents');
			            	}

			            }
			        });
				}
			}
		});

	});
	
	
	

///////////////////////////////////////////////////////////////////////////////////////////

	

	//로그인 검증~~

	//ID 입력값 검증.

	$('#signInId').on('keyup', function() {

		if($("#signInId").val() == ""){

			$('#signInId').css("background-color", "pink");

			$('#idCheck').html('<b style="font-size:16px;color:red;">[아이디는 필수 정보에요!]</b>');

			chk1 = false;
			

		}		


		 else {

			$('#signInId').css("background-color", "aqua");

			$('#idCheck').html('<b style="font-size:16px;color:green;">[참 잘했어요~♡]</b>');

			chk1 = true;

		}
		
		

	});

	

	//패스워드 입력값 검증.

	$('#signInPw').on('keyup', function() {

		//비밀번호 공백 확인

		if($("#signInPw").val() == ""){

		    $('#signInPw').css("background-color", "pink");

			$('#pwCheck').html('<b style="font-size:16px;color:red;">[패스워드는 필수정보에요!]</b>');

			chk2 = false;

		}		         

		//비밀번호 유효성검사

		else if(!getPwCheck.test($("#signInPw").val()) || $("#signInPw").val().length < 8){

		    $('#signInPw').css("background-color", "pink");

			$('#pwCheck').html('<b style="font-size:16px;color:red;">[비밀번호 입력해주세요!]</b>');

			chk2 = false;

		} else {

			$('#signInPw').css("background-color", "aqua");

			$('#pwCheck').html('<b style="font-size:16px;color:green;">[참 잘했어요~♡]</b>');

			chk2 = true;

		}

		

	});

});//JQuery함수의 종료


</script>






