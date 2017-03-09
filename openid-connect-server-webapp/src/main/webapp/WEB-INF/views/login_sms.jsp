<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="authz" uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="o" tagdir="/WEB-INF/tags"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<o:header title="Log In with your phone" />



<link href="resources/bootstrap2/css/bootstrap.css" rel="stylesheet">

<link href="resources/css/bootstrap-sheet.css" rel="stylesheet">

<link href="resources/css/mitreid-connect.css" rel="stylesheet">

<link href="resources/css/mitreid-connect-local.css" rel="stylesheet">

<link href="resources/bootstrap2/css/bootstrap-responsive.css" rel="stylesheet">

<link href="resources/css/mitreid-connect-responsive.css" rel="stylesheet">

<link href="resources/css/mitreid-connect-responsive-local.css" rel="stylesheet">

<link href="resources/css/sms.css" rel="stylesheet">



<link rel="shortcut icon" href="resources/images/mitreid-connect.ico">



<!-- Load jQuery up here so that we can use in-page functions -->

<script type="text/javascript" src="resources/js/lib/jquery.js"></script>

<script type="text/javascript" charset="UTF-8" src="resources/js/lib/moment-with-locales.js"></script>

<script type="text/javascript" src="resources/js/lib/i18next.js"></script>



<script type="text/javascript">

    <!--



    $(document).ready(function() {

        // select the appropriate field based on context

        $('#j_phone_number').focus();

    });



    //-->

</script>



<body>

<div class="container-fluid main">

	<table border="0" cellpadding="0" cellspacing="0" class="login_table">

		 <tbody><tr>	 

			 <td width="290" height="407" bgcolor="#4FAD28"><img src="resources/images/login_icon1.jpg" width="100%" alt=""></td>

			 <td width="20" bgcolor="#4FAD28"><img src="resources/images/seperator.jpg" width="20" height="407" alt=""></td>

		   

			<td height="407">

			     <table border="0" cellpadding="2" cellspacing="0">

					  <tbody>





<tr><td height="65" bgcolor="#4FAD28"></td></tr>

					  <tr>

						  <td width="300" height="105" bgcolor="#4FAD28">

							<form action="${ config.issuer }${ config.issuer.endsWith('/') ? '' : '/' }j_spring_security_check" method="POST">

						   <table width="350" border="0" align="center" bgcolor="#4FAD28" cellpadding="0" cellspacing="0" style="padding-right:10px;">

							 <tbody>

<tr><td colspan="2" align="center" height="100px"><img src="resources/images/mobilis_logo.svg"></td></tr>

<tr><td></td></tr>

<tr><td colspan="2">

<div class="row-fluid">

        <div class="text-center">

            <h4><spring:message code="login.login_with_phone"/></h4>

        </div>

    </div>

</td></tr>

							 <tr height="33" valign="center">

							   <td align="left" width="160"><b>Phone Number</b> </td>

							   <td align="left" width="200"><input type="text" placeholder="<spring:message code="login.phone"/>" autocorrect="off" autocapitalize="off" autocomplete="off" spellcheck="false" value="<c:out value="${ login_hint }" />" id="j_phone_number" name="j_phone_number" class="login_input_text" ></td>

							 </tr>

							 

							 <tr>

							  <td></td>

							   <td align="left" colspan="2"><input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /><input type="submit" value="<spring:message code="login.login-button"/>" name="submit" class="button_connecter"></td>

						     </tr> 

								<!--<tr><td align="center" height="50" colspan="2"></td></tr>-->

								

							 

						   </tbody></table> </form></td>

					  </tr>	

					  

					  <tr><td height="127" bgcolor="#4FAD28" valign="top">

<c:if test="${ param.error != null }">

        <div class="alert alert-error"><spring:message code="login.error"/></div>

    </c:if>

</td></tr>



					  <!--<tr><td height="100" bgcolor="#4FAD28"></td></tr>-->

			    </tbody></table>

			</td>

		</tr>

		</tbody>

	</table>

<div class="row-fluid">

        <div class="span2 custom-center text-center create-account">

            <a href="registration">Create account</a>

        </div>

    </div>

</div>

</body>



<!--

<div class="container-fluid main">



    <div class="row-fluid">

        <div class="span3 custom-center ">

            <h1 class="banner"><a href="home"><img src="resources/images/RDB_logo.png"></a></h1>

        </div>

    </div>



    <div class="row-fluid">

        <div class="text-center">

            <h3><spring:message code="login.login_with_phone"/></h3>

        </div>

    </div>



    <c:if test="${ param.error != null }">

        <div class="alert alert-error"><spring:message code="login.error"/></div>

    </c:if>





    <div class="row-fluid">

        <div class="span3 well custom-card">

            <img src="resources/images/banner.jpg" class="img-responsive">

            <h1></h1>



            <form action="${ config.issuer }${ config.issuer.endsWith('/') ? '' : '/' }j_spring_security_check" method="POST">

                <div>

                    <div class="input-prepend input-block-level custom-field">

                        <span class="add-on"><i class="icon-user"></i></span>

                        <input type="text" placeholder="<spring:message code="login.phone"/>" autocorrect="off" autocapitalize="off" autocomplete="off" spellcheck="false" value="<c:out value="${ login_hint }" />" id="j_phone_number" name="j_phone_number">

                    </div>

                </div>

                <div>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                    <input type="submit" class="btn btn-block custom-button" value="<spring:message code="login.login-button"/>" name="submit">

                </div>

            </form>

        </div>

    </div>



    <div class="row-fluid">

        <div class="span2 custom-center text-center create-account">

            <a href="registration">Create account</a>

        </div>

    </div>

</div>

-->