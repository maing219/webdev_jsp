<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
</head>
<body>
	<jsp:include page="../menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-4">회원관리</h1>
		</div>
	</div>
	<c:set var="mail" value="${ member.mail }" />
	<c:set var="mail1" value="${ mail.split('@')[0] }" />
	<c:set var="mail2" value="${ mail.split('@')[1] }" />
	<c:set var="birth" value="${ member.birth }" />
	<c:set var="birthSplit" value="${ birth.split('/') }"></c:set>
	<c:set var="year" value="${ birthSplit[0] }" />
	<c:set var="month" value="${ birthSplit[1] }" />
	<c:set var="day" value="${ birthSplit[2] }" />
	<div class="container">
		<form method="post" name="updateForm" class="form-horizontal"
			action="./MemberUpdateAction.member?num=${ member.id }">
			<div class="form-group row">
				<label class="col-sm-2 control-label">ID</label>
				<div class="col-sm-5">
					<input name="id" type="text" class="form-control"
						value="${ member.id }" placeholder="id">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">비밀번호</label>
				<div class="col-sm-5">
					<input name="password" type="text" class="form-control"
						placeholder="password" value="${ member.password }">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">이름</label>
				<div class="col-sm-5">
					<input name="name" type="text" class="form-control"
						placeholder="name" value="${ member.name }">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">성별</label>
				<div class="col-sm-10">
					<c:set var="gender" value="${ member.gender }" />
					<input name="gender" type="radio" value="남"
						<c:if test="${ gender.equals('남') }">checked</c:if> /> 남 <input
						name="gender" type="radio" value="여"
						<c:if test="${ gender.equals('여') }">checked</c:if> /> 여
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">생일</label>
				<div class="col-sm-4">
					<input name="birthyy" type="text" maxlength="4" placeholder="년(4자)"
						size="6" value="${ year }"> <select name="birthmm"
						id="month">
						<option value="">월</option>
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> <input name="birthdd" type="text" maxlength="2" placeholder="일"
						size="4" value="${ day }">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-10">
					<input name="mail1" type="text" maxlength="50" value="${ mail1 }">
					@ <select name="mail2" id="mail2">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gamil.com</option>
						<option>nate.com</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control"
						placeholder="phone" value="${ member.phone }">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="address" type="text" class="form-control"
						placeholder="address" value="${ member.address }">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="./MemberDeleteAction.member?id=${ member.id }"
						class="btn btn-danger">삭제</a> <input type="submit"
						class="btn btn-success" value="수정"> <a
						href="./MemberListAction.member" class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
	</div>
	<hr>
	<jsp:include page="../footer.jsp"></jsp:include>
	<script>
		function init() {
			setComboMailValue("${ mail2 }");
			setComboBirthValue("${ month }");
		}

		function setComboMailValue(val) {
			var selectMail = document.getElementById("mail2");
			for (var i = 0; i < selectMail.length; i++) {
				if (selectMail.options[i].value == val) {
					selectMail.options[i].selected = true;
					break;
				}
			}
		}

		function setComboBirthValue(val) {
			var selectBirth = document.getElementById("month");
			for (var i = 0; i < selectBirth.length; i++) {
				if (selectBirth.options[i].value == val) {
					selectBirth.options[i].selected = true;
					break;
				}
			}
		}
	</script>
</body>
</html>