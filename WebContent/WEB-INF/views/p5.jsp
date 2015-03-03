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
	</head>
	<body data-spy="scroll" data-target=".bs-docs-sidebar">
		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
						<span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button>
					<a class="brand" href="/jcf-showcase/index.html">JCF-Showcase</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class=""><a href="/jcf-showcase/index.html">Home</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p1">JCF SUA</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p2">파일업로드/다운로드</a>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p3">대용량조회</a></li>
							<li class=""><a href="/jcf-showcase/openpage.do?viewname=p4">예외 및 메시지처리</a></li>
							<li class="active"><a href="/jcf-showcase/openpage.do?viewname=p5">JCF Query </a></li>
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
						<li><a href="#p51"> <i class="icon-chevron-right"></i>
								JCF Query</a>
							<ul>
								<li><a href="#p51_1">JavaBean 형태 조회</a></li>
								<li><a href="#p51_2">Map 형태 조회</a></li>
								<li><a href="#p51_3">int 형태 조회</a></li>
								<li><a href="#p51_4">JavaBean 형태의 리스트 조회</a></li>
								<li><a href="#p51_5">Map 형태의 리스트 조회</a></li>
								<li><a href="#p51_6">페이징  기반의 리스트 조회</a></li>
								<li><a href="#p51_7">JavaBean 형태의 저장</a></li>
								<li><a href="#p51_8">GridData 형태의 다건 저장</a></li>
								<li><a href="#p51_9">다건 배치 업데이트</a></li>
							    <li><a href="#p51_10">프로시저 호출하기</a></li>
							    <li><a href="#p51_11">함수 호출하기</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<div class="span9">
				<!-- Request Mapping= -->
					<section id="p51">
	         			<div class="page-header">
							<h3>JCF Query</h3>
							<p>
								JCF Query는 DB와 통신하는 데이터 엑세스 처리(DAO)로 본 문서에는 예제만 기술되어 있으며, 테스트 케이스를 통해 실행 및 테스트 해볼 수 있다.<br/>
								관련코드는 com.jcf.sample.query 패키지이며, 테스트 케이스는 test 폴더 밑의 com.jcf.sample.query.QueryServiceTest 이다.<br/>
							</p>
							<pre class="prettyprint linenums">

&lt;!-- jcf-query 를 이용한 applicationContext-dao.xml 설정 --&gt;
&lt;jdbc:embedded-database id="dataSource" type="HSQL"&gt;
	&lt;jdbc:script location="classpath:META-INF/db-script/hsql-sample-db-script.sql"/&gt;
&lt;/jdbc:embedded-database&gt;

&lt;bean id="sqlMapClientTemplate" class="org.springframework.orm.ibatis.SqlMapClientTemplate"&gt;
	 &lt;property name="sqlMapClient" ref="sqlMapClient" /&gt;
&lt;/bean&gt;

&lt;jcfquery:query-config id="queryExecutor" datasource="dataSource" template-engine-type="IBATIS" ibatis-sqlmap-client="sqlMapClient" /&gt;

&lt;bean id="sqlMapClient" class="jcf.query.loader.SqlMapClientFactoryBean"&gt;
	&lt;property name="configLocation" value="classpath:META-INF/ibatis/sqlmap-config.xml" /&gt;
	&lt;property name="mappingLocations" value="classpath:com/jcf/**/sqlmap/*.xml" /&gt;
	&lt;property name="dataSource" ref="dataSource" /&gt;
&lt;/bean&gt;

							</pre>
						</div>
						<section id="p51_1">
							<h4>JavaBean 형태 조회</h4>
							<p>JavaBean 형태의 단건 데이터를 조회한다.</p>
							<pre class="prettyprint linenums">

/**
 * &lt;T&gt; T queryForObject(Object statementTemplate, Object parameter, Class&lt;T&gt; clazz)
 */
public Sample getSampleByBean(Sample param) {
	return commonDao.queryForObject("sample.getSampleByModel", param, Sample.class);
}
							</pre>
						</section>
						<section id="p51_2">
							<h4>Map 형태 조회</h4>
							<p>Map 형태의 단건 데이터를 조회한다.</p>
 							<pre class="prettyprint linenums">

/**
 * Map&lt;String, Object&gt; queryForMap(Object statementTemplate, Object parameter)
 */
public Map&lt;String, Object&gt; getSampleByMap(Map param) {
	Map&lt;String, Object&gt; retValue = commonDao.queryForMap("sample.getSampleByMap", param);
	return retValue;
}
							</pre>
						</section>
						<section id="p51_3">
							<h4>int 형태 조회</h4>
							<p>int 형태의 데이터를 조회한다.</p>
 							<pre class="prettyprint linenums">

/**
 * Integer queryForInt(Object statementTemplate, Object parameter)
 */
public int getSampleByCount(Sample param) {
	return commonDao.queryForInt("sample.getSampleByInt", param);
}

							</pre>
						</section>
						<section id="p51_4">
							<h4>JavaBean 형태의 리스트 조회</h4>
							<p>List &lt;JavaBean&gt; 형태의 데이터를 조회한다.</p>
 							<pre class="prettyprint linenums">

/**
 * &lt;T&gt; List&lt;T&gt; queryForList(Object statementTemplate, Object parameter, Class&lt;T&gt; clazz)
 */
public List&lt;Sample&gt; getSampleListByBean(Sample param) {
	return commonDao.queryForList("sample.getSampleByModel", param, Sample.class);
}
							</pre>
						</section>
						<section id="p51_5">
							<h4>Map 형태의 리스트 조회 </h4>
							<p>List&lt;Map&gt; 형태의 데이터를 조회한다.</p>
 							<pre class="prettyprint linenums">

/**
 * List&lt;Map&lt;String, Object&gt;&gt; queryForMapList(Object statementTemplate, Object parameter)
 */
public List&lt;Map&lt;String, Object&gt;&gt; getSampleListByMap(Map param) {
	return commonDao.queryForMapList("sample.getSampleByMap", param);
}
							</pre>
						</section>
						<section id="p51_6">
							<h4>페이징 기반의 리스트 조회</h4>
							<p>skipRows 와 maxRows 에 따라 특정 로우 만큼 데이터를 조회한다.</p>
 							<pre class="prettyprint linenums">
/**
 * &lt;T&gt; List&lt;T&gt; queryForList(Object statementTemplate, Object parameter, final int skipRows, final int maxRows, Class&lt;T&gt; clazz)
 * skipRows 현재 페이지가 보여지기 위해 skip 한 데이터 건수
 * maxRows 한 페이지에서 보여지는 최대 건수
 */
public List &lt;Sample&gt; getSampleListByPaging(Sample param, int skipRows, int maxRows) {
	return commonDao.queryForList("sample.getSampleByModel", param, skipRows, maxRows, Sample.class);
}
							</pre>
						</section>
						<section id="p51_7">
							<h4>JavaBean 형태의 저장</h4>
							<p> JavaBean 형태의 데이터를 저장한다.</p>
 							<pre class="prettyprint linenums">

/**
 * Integer update(Object statementTemplate, Object parameter)
 */
public int insertSample(Sample param) {
	return commonDao.update("sample.insertSample", param);
}
							</pre>
						</section>
						<section id="p51_8">
							<h4>GridData 형태의 다건 저장</h4>
							<p>GridData 형태의 다건 데이터를 rowStatus 상태에 따라 입력, 수정, 삭제를 한다.</p>
 							<pre class="prettyprint linenums">
/**
 * GridData&lt;E&gt; CRUD Example
 */
public void saveSampleList(GridData&lt;Sample&gt; gridData) {
	this.saveGridData(gridData);
}

private &lt;E&gt; void saveGridData(GridData&lt;E&gt; gridData) {
	gridData.forEachRow(new RowStatusCallback&lt;E&gt;() {

		@Override
		public void insert(E record, int rowNum) {
			commonDao.update("sample.insertSample", record);
		}

		@Override
		public void update(E record, E oldRecord, int rowNum) {
			commonDao.update("sample.updateSample", record);
		}

		@Override
		public void delete(E record, int rowNum) {
			commonDao.update("sample.deleteSample", record);
		}

		@Override
		public void normal(E arg0, int arg1) {
		}
	});
}
							</pre>
						</section>
						<section id="p51_9">
							<h4>다건 배치 업데이트</h4>
							<p>배열 형태의 데이터를 받아 배치 업데이트를 한다.</p>
 							<pre class="prettyprint linenums">

public int[] updateSampleBatch(Sample[] param) {
	return commonDao.batchUpdate("sample.updateSample", param);
}
							</pre>
						</section>
						<section id="p51_10">
							<h4>프로시저 호출하기</h4>
							<p>DBMS 프로시저를 호출한다.(Oracle경우 예)</p>
 							<pre class="prettyprint linenums">

/**
 * Map&lt;String, Object&gt;  executeProcedure(String schema, String packageName, String procedureName, Object parameter)
 * @param param
 * @return
 */
public Map&lt;String, Object&gt; executeProcedure(Map param) {
	return commonDao.executeProcedure("SCHEMA", "PKG_NAME", "SP_NAME", param);
}
							</pre>
						</section>
						<section id="p51_11">
							<h4>함수 호출하기</h4>
							<p>DBMS 함수를 호출한다.(Oracle경우 예)</p>
 							<pre class="prettyprint linenums">

/**
 * Map&lt;String, Object&gt;  executeFunction(String schema, String packageName, String functionName, Object parameter)
 */
public Map &lt;String, Object&gt; executeFunction(Map param) {
	return commonDao.executeFunction("SCHEMA", "PKG_NAME", "FUN_NAME", param);
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
				<p> Homepage : <a href="http://jcf.daewoobrenic.co.kr/blog/">JCF Blog</a></p>
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
