<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="jcf showcase">
		<meta name="author" content="jcf">
		<title>JCF Showcase</title>

		<!-- Le styles -->
		<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet">
		<link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="assets/bootstrap/css/docs.css" rel="stylesheet">
		<link href="assets/bootstrap/css/prettify.css" rel="stylesheet">
		<link rel="stylesheet" href="assets/css/jquery-ui-1.9.2.custom.css" />
		<!-- 공통 lib-->
		<script src="lib/jquery-1.9.0.js"></script>
		<script src="lib/jquery-ui-1.9.2.custom.js"></script>
		<script src="assets/bootstrap/js/bootstrap.js"></script>
		<script src="assets/bootstrap/js/prettify.js"></script>
		<script src="assets/bootstrap/js/application.js"></script>
		<script src="js/p4.js"></script>
	</head>

	<body data-spy="scroll" data-target=".bs-docs-sidebar">
		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<a class="brand" href="/jcf-showcase/index.html">JCF-Showcase</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class=""><a href="/jcf-showcase/index.html">Home</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p1">JCF SUA</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p2">파일업로드/다운로드</a>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p3">대용량조회</a></li>
							<li class="active"><a href="/jcf-showcase/openpage.do?viewname=p4">예외 및 메시지처리</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p5">JCF Query </a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p6">활용 CASE</a></li>
							<li class=""><a href="#">JCF-IAM(개발예정)</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Subhead -->
		<header id="overview"> </header>
		<div class="container">
			<!-- Docs nav -->
			<div class="row">
				<div class="span3 bs-docs-sidebar">
					<ul class="nav nav-list bs-docs-sidenav">
						<li><a href="#p41"> <i class="icon-chevron-right"></i>예외처리</a>
							<ul>
								<li><a href="#p41_0">비즈니스 예외처리</a></li>
								<li><a href="#p41_1">Parameter를 맵핑한 비즈니스 예외처리</a></li>
								<li><a href="#p41_2">시스템 예외에 대한 메시지처리</a></li>
							</ul>
						</li>
						<li><a href="#p42"> <i class="icon-chevron-right"></i>다국어 처리</a>
							<ul>
								<li><a href="#p42_1">Client 브라우저의 locale 값에 따른 메시지 다국어 처리</a></li>
								<li><a href="#p42_3">Parameter 기반의 다국어 처리</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="span9">
					<!-- Request Mapping -->
					<section id="p41">
	         			<div class="page-header">
							<h3 >예외처리</h3>
							<p>
					 			JCF 를 활용하여 비즈니스 예외와 시스템 예외에 대하여 일괄적으로 처리한다.<br/>
					 			관련 코드는 com.jcf.sample.exception 패키지에 자세히 나와있다.
							</p>
						</div>
						<section id="p41_0">
							<h4 >비즈니스 예외처리</h4>
							<div class="bs-docs-example" ><br />ID 가 누락되었다는 예외 메시지를 던진다.
								<button class="btn" id="p41_0_btn1">예외메시지</button><br /> <br />
								<div id="p41_0_result" class="bs-docs-example-result"></div>
							</div>
							<pre class="prettyprint linenums">

&lt;!-- MessageSource --&gt;
&lt;bean id="messageSource" class="org.springframework.context.support.ReloadableResourceBundleMessageSource"&gt;
	&lt;property name="basename" value="classpath:/META-INF/messages/message" /&gt;
	&lt;property name="defaultEncoding" value="utf-8" /&gt;
&lt;/bean&gt;

&lt;bean id="messageSourceAccessor" class="org.springframework.context.support.MessageSourceAccessor"&gt;
	&lt;constructor-arg ref="messageSource" /&gt;
&lt;/bean&gt;

public void makeBizException(String id) {
	if (StringUtils.isEmpty(id)) {
		throw new BizException("MSG_0001");
	}
}
							</pre>
						</section>
						<section id="p41_1">
							<h4 >Parameter를 맵핑한 비즈니스 예외처리</h4>
							<div class="bs-docs-example" ><br />{0} 에 들어갈 메시지를 넣어줄 수 있다.
								<button class="btn" id="p41_1_btn1">예외메시지</button><br /> <br />
								<div id="p41_1_result" class="bs-docs-example-result"></div>
							</div>
							<pre class="prettyprint linenums">

&lt;!-- message.properties --&gt;
ERR_0002={0} (\uC774)\uAC00 \uD2C0\uB9BD\uB2C8\uB2E4.

public void makeBizExceptionWithParam() {
	throw new BizException("ERR_0002", new String[]{"PASSWORD"});
}
							</pre>
						</section>
						<section id="p41_2">
							<h4>시스템 예외에 대한 메시지처리 </h4>
							<p>시스템 예외에 대한 메시지처리 .</p>
							<div class="bs-docs-example" ><br />
								<button class="btn" id="p41_2_btn1">시스템 예외메시지</button><br /> <br />
								<div id="p41_2_result" class="bs-docs-example-result"></div>
							</div>
 							<pre class="prettyprint linenums">

&lt;!-- javascript --&gt;
$.ajax({
	...
	error : function(request, status, error){
	  $('#p41_2_result').html("예상치 못한 시스템 예외가 발생하였습니다.");
    }
    ...
});

public void makeSysException() {
	commonDao.queryForMap("no_namespace.no_sql", null);
}
							</pre>
						</section>
					</section>
					<section id="p42">
        				<div class="page-header">
							<h3 >다국어 처리</h3>
							<p>
								JCF 다국어 처리 기능은 Spring의 Local resolver 통해 다국어를 지원한다.<br/>
					 			관련 코드는 com.jcf.sample.message 패키지에 자세히 나와있다.
							</p>
						</div>
						<section id="p42_1">
							<h4>Client의 locale 값에 따른 메시지 다국어 처리</h4>
							<p>
							   Client의 locale 값에 따른 메시지 다국어 처리.<br>
							   사용자의 브라우져에서 보내진 request 헤더의 accept-language부분에서 Locale을 읽어들인다. (AcceptHeaderLocaleResolver)
							</p>
							<div class="bs-docs-example" ><br/>
								현재 SessionLocaleResolver 로 처리되어 있으며 이 설정을 사용하기 위해서는 SessionLocaleResolver 관련설정을 주석처리하여 실행한다.<br/><br />
								<button class="btn" id="p42_3_btn1">Client 브라우저의 locale 값에 따른 메시지</button>
								<br /> <br />
								<div id="p42_3_result"  class="bs-docs-example-result"></div>
							</div>
							<pre class="prettyprint linenums">

&lt;!-- Default --&gt;
&lt;bean id="localeResolver" class="org.springframework.web.servlet.i18n.AcceptHeaderLocaleResolver" /&gt;

@RequestMapping("/getLocalMsg")
public void getLocalMessage(MciRequest request, MciResponse response) {
	String msg = messageSourceAccessor.getMessage("MSG_0001");

	response.addSuccessMessage("Message : " + msg);
}
							</pre>
						</section>
						<section id="p42_3">
							<h4>Parameter 기반의 다국어 처리</h4>
							<p>HandlerMapping에 인터셉터를 등록하여 특정 파라미터에 넘어 온 값으로 locale을 알아내어 다국어를 처리한다. (SessionLocaleResolver)</p>
							<div class="bs-docs-example" ><br />
								<button class="btn" id="p42_2_btn1">한글 설정</button>
								<button class="btn" id="p42_2_btn2">영문 설정</button>
								<br /> <br />
								<div id="p42_2_result"  class="bs-docs-example-result"></div>
							</div>
							<pre class="prettyprint linenums">

&lt;!-- 다국어 설정 --&gt;
&lt;bean id="localeResolver" class="org.springframework.web.servlet.i18n.SessionLocaleResolver" /&gt;

&lt;bean id="localeChangeInterceptor" class="org.springframework.web.servlet.i18n.LocaleChangeInterceptor"&gt;
   	&lt;property name="paramName" value="toLang"/&gt;
&lt;/bean&gt;

&lt;jcfsua:sua-config ...&gt;
	...
	&lt;jcfsua:custom-interceptor ref="localeChangeInterceptor"/&gt;
	...
&lt;/jcfsua:sua-config&gt;

@RequestMapping("/getMultiLang")
public void getMultiLang(MciRequest request, MciResponse response) {
	String msg = messageSourceAccessor.getMessage("MSG_0002");

	response.addSuccessMessage("Message : " + msg);
}

							</pre>
						</section>
					</section>
				</div>
			</div>
		</div>
		<!-- Footer -->
		<footer class="footer">
			<div class="container">
		 		<p>Homepage : <a href="http://jcf.daewoobrenic.co.kr/blog/">JCF Blog</a></p>
        		<p>E-Mail : <a href="mailto:jcf@disc.co.kr">jcf@disc.co.kr</a></p>
        		<p>Copyright © 2013 Daewoo Information Systems Co., Ltd..</p>
			</div>
		</footer>

		<!-- Analytics -->
		<script>
			var _gauges = _gauges || [];
			(function() {
				var t = document.createElement('script');
				t.type = 'text/javascript';
				t.async = true;
				t.id = 'gauges-tracker';
				t.setAttribute('data-site-id', '4f0dc9fef5a1f55508000013');
				t.src = '//secure.gaug.es/track.js';
				var s = document.getElementsByTagName('script')[0];
				s.parentNode.insertBefore(t, s);
			})();
		</script>
	</body>
</html>
