<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.util.*, user.*"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDAO memberDAO = new MemberDAO();
	
	List memberList = memberDAO.listMembers();
	
	String type = "hidden";
	
	MemberBean memberbean = new MemberBean();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Member-List</title>
		<!--<link rel="stylesheet" href="resources/css/style.css?after" type="text/css" />-->
		
		<style type="text/css">
			html,body{
				width:100%;
				height:100%;
				margin:0;
				padding:0;
			}
			.body-wrapper{
				min-height:100%;
				position:relative;
				}
			.body-content{
				margin-top:100px;
				padding-bottom:99999px;
				}
			html{
				overflow-y:scroll
				}
			body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,form,fieldset,p,button{
				margin:0;
				padding:0
				}
			body,input,button{
				font-family:NanumGothicWeb,verdana,dotum,sans-serif;
				font-size:13px;
				color:#000000;
				}
			body{
				background-color:#fff
				}
			li{
				list-style:none
				}
			.container{
				width:80%;
				margin:0 auto;
				position:relative;
				}
			header{
				margin-top:20px;
				padding:20px;
				background:#fff 
				}
			hgroup{
				overflow:hidden;
				padding-bottom:20px
				}
			div h1{
				color:#000000;
				font-size:22px;
			}
			table tr td{
				color:#000000;
				font-size:15px;
				font-weight:bold;
			}
			table h1{
				color:#66576A;
			}
			hgroup h1{
				float:left;
				color:#000000;
				font-size:34px;
				}
			hgroup h2{
				float:right;
				font-weight:normal;
				color:#000000;
				opacity:0.8
				}
			hgroup h3{
				float:right;
				font-weight:normal;
				color:#000000;
				opacity:0.8
			}
			nav{
				clear:both;
				overflow:hidden;
				border-bottom:1px solid #66576A;
				}
			nav li{
				float:left;
				padding-right:5px;
				font-family:verdana;
				}
			nav li a{
				display:inline-block;
				padding:10px;
				border-radius:5px;
				background-color:#fff;
				text-decoration:none;
				}
			nav a:link { color:#66576A; }
			nav a:visited { color:#66576A; }
			nav a:hover { color:#e3e3e3; }
			nav a:active { color:#66576A; }
			section{
				float:left;
				width:70%;
				height:200px;
				margin-top:15px;
				margin-bottom:20px;
				margin-left:20px;
				padding:20px 1px solid #330000;
				line-height:25px;
				background:#fff;
			}
			section a:link { color:#66576A; }
			section a:visited { color:#66576A; }
			section a:hover { color:#e3e3e3; }
			section a:active { color:#66576A; }
			article{
				margin-bottom:10px;
				}
			article h1{
				font-size:24px;
				color:#000000;
				}
				
			article table h1{
				font-size:24px;
				color:#66576A;
			}
			article h3{ 
				font-size:16px;
				color:#000000;
				}
			aside{
				float:right;
				width:20%;
				height:200px;
				padding:20px;
				margin-top:15px;
				}
			aside .ad{
				height:100px;
				margin-bottom:20px;
				background-color:#ebebeb;
				}
			footer{
				clear:both;
				padding-top:10px;
				border-top:1px solid #66576A;
				background:#fff;
				text-align:center;
				width:100%;
				height:60px;
				position:fixed;
				bottom:0;
				left:0;
				z-index:10000;
				}
			footer a{
				text-decoration:none;
			}
			footer a:link { color:#66576A; }
			footer a:visited { color:#66576A; }
			footer a:hover { color:#e3e3e3; }
			footer a:active { color:#66576A; }
			
			.memlistbtn {
				position:fixed;
				left:0;
				top:0;
				box-shadow:inset 0px 1px 0px 0px #ffffff;
				background:linear-gradient(to bottom, #f9f9f9 5%, #fffcff 100%);
				background-color:#f9f9f9;
				border:0px;
				display:inline-block;
				cursor:pointer;
				color:#66576A;
				font-family:Arial;
				font-size:15px;
				font-weight:bold;
				padding:7px 13px;
				text-decoration:none;
				text-shadow:0px 1px 0px #b0b0b0;
			}
			.memlistbtn:hover {
				background-color:#ffffff;
				color:#e3e3e3;
			}
			.memlistbtn:active {
				position:fixed;
				left:0px;
				top:1px;
			}
			.signinbtn {
				position:absolute;
				right:0;
				top:0;
				box-shadow:inset 0px 1px 0px 0px #ffffff;
				background:linear-gradient(to bottom, #f9f9f9 5%, #fffcff 100%);
				background-color:#f9f9f9;
				border:1px solid #66576A;
				display:inline-block;
				cursor:pointer;
				color:#000000;
				font-family:Arial;
				font-size:15px;
				font-weight:bold;
				font-style:italic;
				padding:7px 13px;
				text-decoration:none;
				text-shadow:0px 1px 0px #b0b0b0;
			}
			.signinbtn:hover {
				background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
				background-color:#e9e9e9;
			}
			.signinbtn:active {
				position:absolute;
				right:0px;
				top:1px;
			}
			.sign {
				display: flex;
			  	justify-content: center;
			  	align-items: center;
			}
			.signtext{
			  padding: 3rem;
			  border-radius: 1rem;
			  background: #66576A;
			}
			.btndesign{
				box-shadow:inset 0px 1px 0px 0px #ffffff;
				background:linear-gradient(to bottom, #f9f9f9 5%, #fffcff 100%);
				background-color:#f9f9f9;
				border:1px solid #66576A;
				display:inline-block;
				cursor:pointer;
				color:#000000;
				font-family:Arial;
				font-size:13px;
				font-weight:bold;
				padding:7px 13px;
				text-decoration:none;
				text-shadow:0px 1px 0px #b0b0b0;
			}
			.btndesign:hover {
				background:linear-gradient(to bottom, #e9e9e9 5%, #f9f9f9 100%);
				background-color:#e9e9e9;
			}
			.newbtn {
				box-shadow:inset 0px 1px 0px 0px #ffffff;
				background:linear-gradient(to bottom, #f9f9f9 5%, #fffcff 100%);
				background-color:#f9f9f9;
				border:0px;
				display:inline-block;
				cursor:pointer;
				color:#66576A;
				font-family:Arial;
				font-size:15px;
				font-weight:bold;
				padding:7px 13px;
				text-decoration:none;
				text-shadow:0px 1px 0px #b0b0b0;
			}
			.newbtn:hover {
				background-color:#ffffff;
				color:#e3e3e3;
			}
			.newbtn:active {
				position:relative;
				top:1px;
			}
			.space {
				width:100%;
			}
			.deletebtndesign{
				display:inline-block;
				cursor:pointer;
				color:#ff0000;
				font-family:Arial;
				font-size:13px;
				font-weight:bold;
				padding:7px 13px;
				text-decoration:none;
				text-shadow:0px 1px 0px #b0b0b0;
			}
			.deletebtndesign a:link { color:#ff0000; }
			.deletebtndesign a:visited { color:#ff0000; }
			.deletebtndesign a:hover { color:#e3e3e3; }
			.deletebtndesign a:active { color:#ff0000; }
			
			.postbtn {
				color:#66576A;
				background-color:#ffffff;
				font-family:verdana;
				font-size:13px;
				padding:10px;
				text-decoration:none;
				border:0px;
			}
			.postbtn:hover {
				background-color:#ffffff;
				color:#e3e3e3;
			}
		</style>
	</head>
	<body>
		<div id="container">
			<a href="memlist.jsp" class="memlistbtn">Member List</a>
			<h3 align="right"> <%=session.getAttribute("id") %> is Log In. &nbsp;&nbsp; <a href="logout.jsp" class="newbtn">Log Out</a><a href="meminfo.jsp" class = "newbtn">Mem Info</a></h3> 
			<br>
			<header>
				<hgroup>
					<h1>New Post</h1>
					<br><br><br><br>
				</hgroup>
			</header>
			
			<nav>
				<ul>
					<li><a href="main.jsp">Hello World</a></li>
					<li><a href="board.jsp">Daily-Story</a></li>
				</ul>
			</nav>
			
			<section class="space">
				<article>
					<div class="sign">
						<div class="signtext">
						<h1 style="text-align:center">sign up</h1><br>
						<table>
							<tr align="center"><td>ID</td><td>Password</td><td>Name</td><td>E-mail</td><td>JoinDate</td><td></td></tr>
							<%if(memberList.size() == 0) { %>
								<tr><td><h1>There is no Member</h1></td></tr>
							<%} else { 
									for(int i=0; i<memberList.size(); i++) {
										MemberBean bean = (MemberBean)memberList.get(i);
							%>
								<tr align="center">
									<td><%=bean.getId() %></td>
									<td><%=bean.getPwd( )%></td>
									<td><%=bean.getName() %></td>
									<td><%=bean.getEmail() %></td>
									<td><%=bean.getJoinDate() %></td>
									<td><a href="memdel?id=<%=bean.getId() %>" class="deletebtndesign">X</a></td>
								</tr>
							<%
									}
								}
							%>
							</table>
						</div>
					</div>
				</article>
			</section>
		</div>
	</body>
</html>