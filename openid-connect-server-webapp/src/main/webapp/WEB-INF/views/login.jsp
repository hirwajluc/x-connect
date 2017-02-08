<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<o:header title="Log In" />
<link href="resources/bootstrap2/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/bootstrap-sheet.css" rel="stylesheet">
<link href="resources/css/mitreid-connect.css" rel="stylesheet">
<link href="resources/css/mitreid-connect-local.css" rel="stylesheet">
<link href="resources/bootstrap2/css/bootstrap-responsive.css" rel="stylesheet">
<link href="resources/css/mitreid-connect-responsive.css" rel="stylesheet">
<link href="resources/css/mitreid-connect-responsive-local.css" rel="stylesheet">

<link rel="shortcut icon" href="resources/images/mitreid-connect.ico">

<!-- Load jQuery up here so that we can use in-page functions -->
<script type="text/javascript" src="resources/js/lib/jquery.js"></script>
<script type="text/javascript" charset="UTF-8" src="resources/js/lib/moment-with-locales.js"></script>
<script type="text/javascript" src="resources/js/lib/i18next.js"></script>

<script type="text/javascript">
<!--

$(document).ready(function() {
	// select the appropriate field based on context
	$('#<c:out value="${ login_hint != null ? 'j_password' : 'j_username' }" />').focus();
});

//-->
</script>
<!--<o:topbar />-->
<div class="container-fluid main">

	<div class="row-fluid">
		<div class="span3 custom-center ">
			<h1 class="banner"><a href="home"><img src="resources/images/RDB_logo.png"></a></h1>
		</div>
	</div>

	<div class="row-fluid">
		<div class="text-center">
			<h3>Sign in to your X-Connect account</h3>
		</div>
	</div>

	<c:if test="${ param.error != null }">
		<div class="alert alert-error"><spring:message code="loginoidc.error"/></div>
	</c:if>


	<div class="row-fluid">
		<div class="span3 well custom-card ">
			<img src="resources/images/banner.jpg" class="img-responsive">
			<h1></h1>

			<form action="${ config.issuer }${ config.issuer.endsWith('/') ? '' : '/' }j_spring_security_check" method="POST">
				<div>
					<div class="input-prepend input-block-level">
						<span class="add-on"><i class="icon-user"></i></span>
						<input type="text" placeholder="Enter your EmailID" autocorrect="off" autocapitalize="off" autocomplete="off" spellcheck="false" value="<c:out value="${ login_hint }" />" id="j_username" name="j_username">
					</div>
				</div>
				<div>
					<div class="input-prepend input-block-level">
						<span class="add-on"><i class="icon-lock"></i></span>
						<input type="password" placeholder="Enter your password" autocorrect="off" autocapitalize="off" autocomplete="off" spellcheck="false" id="j_password" name="j_password">
					</div>
				</div>
				<div>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<input type="submit" class="btn btn-block btn-success" value="Sign In" name="submit">
				</div>
			</form>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span2 custom-center text-center create-account">
			<a href="registration">Create Account</a>
		</div>
	</div>
</div>

<o:footer/>
