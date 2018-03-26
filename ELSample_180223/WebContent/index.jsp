<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.TestBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index.jsp</title>
</head>
<body>

<!-- 	
	1.EL (Expression Language) 웹 전용 표현 언어다. 자바를 사용하지 않고 태그를 사용해서.
		표현			언어
		
		: jsp 안의 java 코드.
			html + java = jsp
			
			jsp안의 java코드를 tag로 대체해서 사용하기 위한 용도.
		
	2.Core : el태그와 같이 사용.
				제어문.(for, 조건문등등)
				
				
				웹에서 자바코드를 사용하는것을 배제하는것.
				java 코드 배제 -> Node.js
								Ajax사용
							
							
	3.JSTL(Java server page Standard Tag Library) - C++의 JSTL과는 다른것이다. 혼동 유의
 -->
 
 
 <%-- EL --%>
 
 <%
 	String hello = "Hello";
	
	request.setAttribute("str", hello);
						
	
 %>
 
 
 <%
 	//같은 뷰에서는 바로 끄집어서 사용가능하다.
 	String str = (String)request.getAttribute("str");
 %>
 
 
 <%
 	out.println("str : " + str);
 %>
 
 <br><br>
 
	str=<%=str %> <br><br><br>
	
	
	str=${str }<br><br>
	
	
	<%='값'%>
	<br>
	<%=12 %>
	<br>
	${'값' }
	<br><br>
	
	<%=2+5 %><!-- 연산도 가능하다. -->
	<br>
	${2+5 }
	<br><br>
	
	
	${3>2?100:200 }
	<br><br>
	
	
	<%
		request.setAttribute("data", "aaa");
	%>

	${data }
	<br><br>
	
	
	
	-- 변수인 data가 비어있는지?(== null)
	<br>
	data = ${empty data }
	<br><br>
	
	-- 변수인 data가 비어있는지 않은지?(!= null)
	<br>
	data = ${not empty data }
	<br><br>
	
	
	<pre>
	
		${1<9 }	<!-- 판정 -->
		${1+2 }	<!-- 연산 -->
	</pre>
	
	
	
	<%
		Integer a, b;
		
		a = 10;
		b = 3;
		
		request.setAttribute("a", a);
		request.setAttribute("b", b);
		
		Boolean boo = false;
		request.setAttribute("_boo", boo);
	%>
	
	<pre>
		a : ${a }
		b : ${b }
		boo : ${_boo } <!-- setAttribute로 설정한것은 이름 정한것을 넣는거다. -->
	
		eq : ${a eq b }	<!-- == -->
		eq : ${a == b } <!-- 위와 같은 코드 -->
		
		ne : ${a ne b }	<!-- != -->
		ne : ${a != b }	
		
		
		lt : ${a lt b }	<!-- 부등호 기호 < -->
		lt : ${a < b } <!-- 위와 같은 것. -->
		
		gt : ${a gt b }	<!-- > -->
		gt : ${a > b }
		
		le : ${a le b }	<!-- <= -->
		le : ${a <= b }	
		
		ge : ${a ge b }	<!-- >= -->
		ge : ${a >= b }
		
		
		div : ${a div b } <!-- / 나눈 몫 -->
		div : ${a / b }
		
		mod : ${a mod b }
		mod : ${a % b }
		
		
		_boo : ${!_boo } <!-- ! not 표현 -->
		
		논리 연산 : ${a == 10 && !_boo }
	</pre>
	
	
	<%
		request.setAttribute("StringData", "testtest");
	
		
	%>
	
		StringData : ${requestScope.StringData } <!-- requestScope. 기본적으로 생략되어있는것. -->
		
		<br><br>
		
		
		
		<%
			TestBean bean = new TestBean();
		
		bean.setMessage("hi EL tag");
		
		request.setAttribute("testBean", bean);/* 항상 "testBean" 이런식으로 넣어야한다. */
		%>
		
		
		<%=bean.getMessage() %>
		<br>
		
		${testBean.message } <!-- 가지고 있는 변수명을 바로 적어주면 된다. 자동적으로 getter 호출되는것. -->
		<br>
		<br>
		
		
		<%
			String array[] = new String[]{ "hello", "world" };
		
			request.setAttribute("_array", array);
		%>
		<%=array[0] %>
		<br>
		
		${_array[0] }
		<br><br>
		
		
		<%
			List<String> list = new ArrayList<String>();
		
			list.add("hi");
			list.add("EL tag");
			
			request.setAttribute("_list", list);
		%>
		
		list index 0 : ${_list[0] }<br>
		list index 1 : ${_list[1] }
		<br><br>
		
		
		
		<%
			HashMap<String, String> map = new HashMap<String, String>();
		
			map.put("key1", "value1");
			map.put("key2", "value2");
			
			request.setAttribute("_map", map);
		%>
		
		${_map["key2"] }<br> <!-- 표현방법은 두가지 -->
		${_map.key1 }
		<br><br>
		
		
		
		
		<!-- 파라메타로 넘어가는것. -->
		<form action="NewFile.jsp">
		
			<input type="text" name="name" value="abcde">
			<br>
			<input type="submit" value="EL 전송">
		
		</form>
		
</body>
</html>