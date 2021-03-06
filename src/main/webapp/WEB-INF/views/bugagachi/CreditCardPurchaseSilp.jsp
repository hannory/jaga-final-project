<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가 경리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <style>
        *{
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        .middleMenu{
            background-color: #24574A;
            color: white;
            height: 40px;
        }
        .middleMenu>h4{
            padding: 8px;
        }
        #totalSum{
            text-align: center;
            margin-top: 15px;
            margin-bottom:40px;
            width:100%;
        }
        #totalSum tr{
        	height: 80px;
        }
        #totalSum td{
            border: 1px solid #C9CACE; 
            
        }
       .green{
            background-color: #D9EAD3;
            font-weight: 700;
        }  
        .green_value{
        	background-color: #F3F4F6;
        	width:18%;
        	
        }
        #Tex_bill_detailList{
            margin-top: 25px;
            margin-bottom: 25px;
            margin-left: auto;
            margin-right: auto;
            width: 98%;
            text-align: center;
        }
        #Tex_bill_detailList tr{
        	height: 50px;
        }
        #Tex_bill_detailList td{
            border: 1px solid #C9CACE; 
            width: 20%;
        }
        .Tex_bill_th{
            background-color:#E7E6E6;
        }
        #Text_billNo{
            background-color:#E7E6E6;
            height: 25px;
        }
        #Tex_bill_code{
            border: 1px solid black;
        }
        .breadcrumb>li{
        	margin: auto auto;
        }
   		.cc_year{
   			width:50px;
   			height: 30px;
   		}
   		.cc_month{
   			width:50px; 
   			height: 30px;
   		}
   		#termDiv{
   			width:80px; 
   			height: 30px;
   		}
   		.Tex_bill_code_p{
   			font-size:23px;
   		}
   		.billMainTable{
   			width:100%;
   		}
		.table-justify3 {
			width: 150px;
			display: flex;
			justify-content: space-between;
		}
		#tax_pur{
			align: center;
			text-align: center;
			width: 100%;
			height: 70px;
			margin-bottom: 40px;
			margin-top: 20px;
		}
		#deadlineCen{
			display: none;
			border:1px solid red; 
			color:red;
			margin-left:-85px;
		}
		#loading {
		    width: 100%;  
		    height: 100%;  
		    top: 0px;
		    left: 0px;
		    position: fixed;  
		    display: block;  
		    opacity: 0.7;  
		    background-color: #fff;  
		    z-index: 99;  
		    text-align: center;
		    display: none;
		 } 
     
	   #loading-image {  
		    position: absolute;  
		    top: 50%;  
		    left: 50%; 
		    z-index: 100; 
	    }
	    .numberArea{
   			text-align: right;
   		}
   		#deadlineBtn{
   		width:50px; 
   		height:30px; 
   		background:#24574A; 
   		border:none; 
   		color:white; 
   		border-radius:5px;
   		}
   		.bu{
   		
   		width:50px; 
   		height:30px; 
   		background:#24574A; 
   		border:none; 
   		color:white; 
   		border-radius:5px;
   		
   		}
   		#report{
   		width:130px; 
   		height:30px; 
   		background:#24574A; 
   		border:none; 
   		color:white; 
   		border-radius:5px;
   		
   		}
    </style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<main>
	<div class="container-fluid">
			<h2 class="mt-4">신용카드매출전표등 발행금액 집계표</h2>
	<form action="insertCcIssStmt.cis" method="post">	
	<ol class="breadcrumb mb-4">
		
			<li><button id="deadlineBtn" type="submit">마감</button></li>
		
			<li><button id="deadlineCen" onclick="cencelDeadline()">마감 취소</button></li>
		
			<li><input type="text" readonly  id="termDiv" name="termDiv"></li>
            <li>조회기간:
            	<input type="text" id="search_ye" class="cc_year" name="yearOfAttr" maxlength="4">
            	<select class="cc_month" id="search_mon1">
            		<option value="">월</option>
            		<option value="01">1</option>
            		<option value="07">7</option>
            	</select> 
            	~
            	<select class="cc_month" id="search_mon2">
            		<option value="">월</option>
            		<option value="06">6</option>
            		<option value="12">12</option>
            	</select> 
            </li>
            <li><input type="button" class="bu" onclick="search_cis()" value="조회"></li>
            <li><input type="button" id="report" name="report" value="신고서미리보기"></li>
			
		</ol>
			<!-- 로딩? -->
   <div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
    <!-- 로딩스크립트 -->
    
		
		
		
			<table align="center" class="billMainTable">   
        <tr>
            <td colspan="10">
                <div class="middleMenu">
                    <h4>1.인적사항</h4>
                </div>
            </td>
        </tr>
        <!-- 1.인적사항 표 -->
        <tr>
            <td colspan="10">
                <table align="center" id="totalSum">
                    <tr>
                        <td class="green">상호</td>
                        <td class="green_value"><c:out value="${ sessionScope.loginCompany.bizName }"/></td>
                        <td class="green">성명</td>
                        <td class="green_value"><c:out value="${ sessionScope.loginCompany.bossName }"/></td>
                        <td class="green">사업등록번호</td>
                        <c:set var="comCode" value="${ sessionScope.loginCompany.companyCode }"/>
   						<input type="hidden" value="${comCode}" name="comCode">
   						<input type='hidden' id='taxinvIss'name='taxinvIss'>
   						<input type='hidden' name='invIss'id='invIss'>
					    <input type='hidden' name='cardTax'id='cardTax'>
				    	<input type='hidden' name='cardTaxFree'id='cardTaxFree'>
				    	<input type='hidden' name='cardSvc'id='cardSvc'>
				    	<input type='hidden' name='cashTax'id='cashTax'>
				    	<input type='hidden' name='cashTaxFree'id='cashTaxFree'>
				    	<input type='hidden' name='cashSvc'id='cashSvc'>
				    	<input type='hidden' name='digitalTax'id='digitalTax'>
				    	<input type='hidden' name='digitalTaxFree'id='digitalTaxFree'>
				   		<input type='hidden' name='digitalSvc'id='digitalSvc'>

                        <td class="green_value"><c:out value="${ sessionScope.loginCompany.bizNum }"/></td>
                    </tr>
                    <tr>
                    	<td class="green">사업장소재지</td>
                    	<td class="green_value" colspan="5"><c:out value="${ sessionScope.loginCompany.bizLocation }"/></td>
                    </tr>
                   
                </table>

            </td>
            
        </tr>
        <!-- 1.인적사항 표 끝 -->
        <script type="text/javascript">
        function cencelDeadline(){  
            $("form").attr("action", "updateCcIssStmt.cis");
        }
        /* 콤마 찍기 */
		function comma(str) {
			str = String(str);
			return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
		}
	 	function search_cis(){
	 		 $("#loading").show();
	 		var search_ye= $("#search_ye").val();
	 		var search_mon1= $("#search_mon1").val();
	 		var search_mon2= $("#search_mon2").val();
	 		var comCode='${comCode}';
	 		console.log(search_ye);
	 		console.log(search_mon1);
	 		console.log(search_mon2);
	 		console.log(comCode);
	 		
	 		$.ajax({
	 			url:"ccIssStmt.cis",
	 			type:"post",
	 			data:{search_ye:search_ye, search_mon1:search_mon1, search_mon2:search_mon2, comCode:comCode },
	 			success: function(data){
	 				console.log(data);
	 				 $("#loading").hide();
                  
	 				var cis=data.cis; 
	 				$("#tAc").text(comma(cis.cardTax));
	 				$("#tAcash").text(comma(cis.cashTax));
	 				$("#tAd").text(comma(cis.digitalTax));
	 				$("#fAc").text(comma(cis.cardTaxFree));
	 				$("#fAcash").text(comma(cis.cashTaxFree));
	 				$("#fAd").text(comma(cis.digitalTaxFree));
	 				$("#serAc").text(comma(cis.cardSvc));
	 				$("#serAcash").text(comma(cis.cashSvc));
	 				$("#serAd").text(comma(cis.digitalSvc));
	 				console.log(cis.termDiv);
	 				$("#termDiv").val(comma(cis.termDiv));
	 				$("#dTax").text(comma(cis.taxinvIss));
	 				$("#ndTax").text(comma(cis.invIss));

	 				//input type 에 값넣어주기
					$("#taxinvIss").val(cis.taxinvIss);
					$("#invIss").val(cis.invIss);
					$("#cardTax").val(cis.cardTax);
					$("#cardTaxFree").val(cis.cardTaxFree);
					$("#cardSvc").val(cis.cardSvc);
					$("#cashTax").val(cis.cashTax);
					$("#cashTaxFree").val(cis.cashTaxFree);
					$("#cashSvc").val(cis.cashSvc);
					$("#digitalTax").val(cis.digitalTax);
					$("#digitalSvc").val(cis.digitalSvc);
					$("#digitalTaxFree").val(cis.digitalTaxFree);
				    
	 				//합계부분
					var cardSum=cis.cardTax+cis.cardTaxFree+cis.cardSvc;/* 카드합계 */
					$("#cAs").text(comma(cardSum));
					var cashSum=cis.cashTax+cis.cashTaxFree+cis.cashSvc;/* 현금영수증합계 */
					$("#cashAs").text(comma(cashSum));
					var dSum=cis.digitalTax+cis.digitalTaxFree+cis.digitalSvc;/* 전자지급수단 합계 */
					$("#dAs").text(comma(dSum));
					var taxSum=cis.cashTax+cis.cardTax+cis.digitalTax;
					$("#tAs").text(comma(taxSum));
					var freeSum=cis.cardTaxFree+cis.cashTaxFree+cis.digitalTaxFree;
					$("#fAs").text(comma(freeSum));
					var serSum=cis.cardSvc+cis.cashSvc+cis.digitalSvc;
					$("#serAs").text(comma(serSum));
					var sumSum=taxSum+freeSum+serSum;
					$("#sAs").text(comma(sumSum));
	 				
					//3.교부내역
					$("#dTax").text(comma(cis.taxinvIss));
					$("#ndTax").text(comma(cis.invIss));
					
					//버튼 바꿔주기
						//$("#deadlineCen").hide();
					if(cis.deadline == 'Y'){
						console.log("마감된 애임")
						//var debitCredit = $("<input type='hidden' name='issCode'>").val('comCode');
						console.log()
						$("#deadlineCen").show();
						$("#deadlineBtn").hide();
					}
	 			},
	 			error:function(error){
	 				console.log(error);
	 			}
	 		});
	 	}
	 
	 </script>
        <tr>
            <td colspan="10">
                <div class="middleMenu">
                    <h4>2.신용카드매출전표 등 발행금액 현황</h4>
                </div>
            </td>
        </tr>
        <!--2.신용카드매출전표등 발행 금액 현황 표 시작 -->
        <tr>
            <td colspan="10">
                <div>
                    <table id="Tex_bill_detailList">
                        <tr class="Tex_bill_th" style="font-weight: 800; height: 25px;">
                            <td id="Text_billNo">구 분</td>
                            <td>합 계</td>
                            <td>신용/직불/기명식/선불카드</td>
                            <td style="width:20%;">현금영수증</td>
                            <td style="width:20%;">직불전자지금 수단 및<br>기명식선불 전자지급수단</td>  
                        </tr>
 						<tr>
 							<td class="green" align="center"><div class="table-justify3"><div>합</div><div>계</div></td>
 							<td class="green_value numberArea" id="sAs"></td>
 							<td class="green_value numberArea" id="cAs"></td>
 							<td class="green_value numberArea" id="cashAs"></td>
 							<td class="green_value numberArea" id="dAs"></td>
 						</tr>
 						<tr>
 							<td class="green" align="center"><div class="table-justify3"><div>과</div><div>세</div><div>매</div><div>출</div><div>분</div></td>
 							<td class="green_value numberArea" id="tAs"></td>
 							<td class="numberArea" id="tAc"></td>
 							<td class="numberArea" id="tAcash"></td>
 							<td class="numberArea" id="tAd"></td>
 						</tr>
 						<tr>
 							<td class="green" align="center"><div class="table-justify3"><div>면</div><div>세</div><div>매</div><div>출</div><div>분</div></td>
 							<td class="green_value numberArea" id="fAs"></td>
 							<td class="numberArea" id="fAc"></td>
 							<td class="numberArea" id="fAcash"></td>
 							<td class="numberArea" id="fAd"></td>
 						</tr>
 						<tr>
 							<td class="green" align="center"><div class="table-justify3"><div>봉</div><div>사</div><div>료</div></td>
 							<td class="green_value numberArea" id="serAs"></td>
 							<td class="numberArea" id="serAc"></td>
 							<td class="numberArea" id="serAcash"></td>
 							<td class="numberArea" id="serAd"></td>
 						</tr>
                        
                    </table>
                </div>
            </td>
        </tr>
        <!--2.신용카드매출전표등 발행 금액 현황 표 끝 -->
        <!--3.신용카드매출전표 등 발행금액총 세금계산서 교부내역  -->
        <tr>
        	<td colspan="10">
                <div class="middleMenu">
                    <h4>3.신용카드매출전표 등 발행금액 중 세금계산서 교부내역</h4>
                </div>
            </td>
        </tr>
        <tr>
        	<table id="tax_pur">
        		<tr>
        			<td class="green">세금계산서발급금액</td>
        			<td class="green_value numberArea" style="width: 30%" id="dTax"></td>
        			<td class="green">계산서발급금액</td>
        			<td class="green_value numberArea" style="width: 30%" id="ndTax"></td>
        		</tr>
        	
        	</table>
        	
        </tr>
        <!--3.신용카드매출전표 등 발행금액총 세금계산서 교부내역  -->
        <tr>
            <td colspan="9">
            <!-- 코드영역 -->
                
            </td>
        </tr>
        
    </table>
    </div>

		<div style="height: 100vh;"></div>
		

	
	<script>
	/* 날짜 input jquery ui */
		$.datepicker.setDefaults({
			showOn : "both",
			buttonImageOnly : true,
			buttonImage : "${contextPath}/resources/images/calendar.png",
			dateFormat : 'yy-mm-dd'

		});
		$(function() {
			$(".datepicker").datepicker({});
			/* 달력버튼 */
			$("img.ui-datepicker-trigger")
					.attr("style","margin-left:2px; vertical-align:middle; cursor: Pointer; width:20px; height:20px");

		});
	 </script>
	 </form>	
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>