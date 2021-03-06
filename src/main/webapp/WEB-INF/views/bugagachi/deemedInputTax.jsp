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
        #titleArea{
            width: 50%;
        }
        .middleMenu{
            background-color: #24574A;
            color: white;
            height: 30px;
        }
        .middleMenu>h5{
            padding: 5px;
        }
        .totalSum{
            text-align: center;
          	  margin-top: 15px;
            margin-bottom:40px;
        }
        #deemed{
        	text-align: center;
            margin-top: 15px;
            margin-bottom:40px;
        }
        #deemed td{
        	 /* border: 1px solid #C9CACE;  */
            height: 23px;
            width:25%;
        }
        .totalSum td{
            border: 1px solid #C9CACE; 
            height: 23px;
        }
        .green{
            background-color: #D9EAD3;
            font-weight: 700;
        }
        .green_value{
        	background-color: #F3F4F6;
        	
        }
        #cho_nav1{
            background-color: #1B5748;
            color: white;
        }   
        .Tex_bill_th{
            background-color:#E7E6E6;
        }
        .Tex_bill_td{
            background-color:#E7E6E6;
            width: 10px;
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
        /* td{ border: 1px solid red;} */
        .cho_nav{
        	height: 35px;
        	border: 1px solid #C9CACE;
        	background-color:#8DABA3;
        	color: white;
			border-top-left-radius:10px;
			border-top-right-radius:10px;
        }
        .cho_nav>p{
        	margin-left:5px;
        	margin-right: 5px;
        	margin-top:3px;
        }
        .sumTableSales{
        	width: 20%;
        	padding-left:5%;
        }
   		#List_detail td{
   			border:1px solid #D2D2D6;
   		}
   		#List_detail{
   			text-align: center;
   		}
   		.cc_year{
   			width:50px;
   			height: 30px;
   		}
   		.cc_month{
   			width:50px; 
   			height: 30px;
   		}
   		.Tex_bill_code_p{
   			font-size:23px;
   		}
   		/* .billMainTable{
   			width:100%;
   		} */
   		.total_deemed{
   			text-align: center;
   			width: 99%;
   			border:1px solid #C9CACE;
   		}
   		#total_deemed_div1{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#total_deemed_div2{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#total_deemed_div3{
   			align:center;
   		 	width: 99%;
   		 	float: left;
   		}
   		#tax1{
   		 	width:100%; 
   		 	border:2px solid #C9CACE;
   	  	 	padding:8px;
   		}
   		#tax2{
   			width:100%; 
   		 	border:2px solid #C9CACE;
   	  	 	padding:8px;
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
		} 
	     
	   #loading-image {  
	    	position: absolute;  
		    top: 50%;  
		    left: 50%; 
		    z-index: 100; 
		}
		#deadlineCen{
			display: none;
			border:1px solid red; 
			color:red;
			margin-left:-85px;
		}
		#termDiv{
   			width:80px; 
   			height: 30px;
   		}
		.men_ga td{
			border:1px solid #C9CACE;
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
   		#deadlineBtn{
   		width:50px; 
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
	<form action="deadLine.vd" method="post">
			<h2 class="mt-4">의제매입세액공제 신고서</h2>
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
		
		<!-- 인풋모음 -->
		<c:set var="comCode" value="${ sessionScope.loginCompany.companyCode }"/>
		<input type="hidden" name="comCode" value="${comCode}" id="comCode">
		<input type="hidden" name="deemedCode" id="deemedCode">
		
		
				<!-- 로딩? -->
   <div id="loading">
        <img id="loading-image" src="${ contextPath }/resources/images/loading36.gif" alt="Loading..." />
    </div>
    <!-- 로딩스크립트 -->
    <script type="text/javascript">
    window.onbeforeunload=function(){
        $("#loading").show();
     }
     $(window).load(function(){
        $("#loading").hide();
     });
    
    </script>
		
			<!-- <table align="center" class="billMainTable">   
        매출세금계산서 총합계 표
        <tr>
        공급자 정보표 시작
            <td colspan="3" style="vertical-align: top;"> -->
            	<div style="height:825px; width: 28%; float:left; border:1px solid #D2D2D6;">
	               	 <table id="deemProList" align="center" class="totalSum" style="width: 99%;">
	               	 <thead>
	                    <tr style="background-color: #24574A; color: white;  font-weight: 700;">
	                        <td>공급자</td>
	                        <td>사업자(주민)등록번호</td>
	                    </tr>
	               
	                 </thead>
	               	<tfoot>
	               		<tr>
	               			<td></td>
	               			<td></td>
	               		</tr>
	               	</tfoot>   	
	                </table>
				</div><!-- table01 ---------------------->
            <!-- 공급자 정보표 끝-->
            
            
            
            
            
            
            
    <div style="width: 72%; float:left; border:1px solid #D2D2D6;"><!-- 오른쪽 영역 -->
            
  				<div id="total_deemed_div1"><!-- 의제매입 합계표div -->
  				
  				<table border="1" align="center" class="total_deemed totalSum">
	            				<tr class="Tex_bill_th" style="font-weight: 800;">
	            					<td colspan="2">구 분</td>
	            					<td>매입처수</td>
	            					<td>건  수</td>
	            					<td>매입가액</td>
	            					<td>공제율</td>
	            					<td>의제매입세액</td>
	            				</tr>
	            				
	            				<tr>
	            					<td colspan="2" class="green">합  계</td>
	            					<td class="green_value" id="proCountSum"></td>
	            					<td class="green_value" id="countSum"></td>
	            					<td class="green_value" id="priceCountSum"></td>
	            					<td class="green_value">8/108</td>
	            					<td class="green_value" id="deemTaxCountSum"></td>	
	            				</tr>
	            				<tr>
	            					<td rowspan="2" class="green">사업자로부터의 <br>매입분</td>
	            					<td class="green">계산서</td>
	            					<td class="green_value" id="proCountBill"></td>
	            					<td class="green_value" id="countBill"></td>
	            					<td class="green_value" id="priceCountBill"></td>
	            					<td class="green_value">8/108</td>
	            					<td class="green_value" id="deemTaxCountBill"></td>	
	            				</tr>
	            				<tr>
	            					<td class="green">신용카드</td>
	            					<td class="green_value" id="proCountCard"></td>
	            					<td class="green_value" id="countCard"></td>
	            					<td class="green_value" id="priceCountCard"></td>
	            					<td class="green_value">8/108</td>
	            					<td class="green_value" id="deemTaxCountCard"></td>	
	            				</tr>
	            				<tr>
	            					<td colspan="2" class="green">농어민으로부터의 매입분</td>
	            					<td class="green_value" id="fProCount"></td>
	            					<td class="green_value" id="fCount"></td>
	            					<td class="green_value" id="fPriceCount"></td>
	            					<td class="green_value">8/108</td>
	            					<td class="green_value" id="fDeemTaxCount"></td>	
	            				</tr>
	            			
	            			</table>
  				</div><!-- 의제매입 합계표div 끝 -->
  				
  				<div id="total_deemed_div2">
  					<table id="farm" border="1" align="center" class="totalSum" style="width: 99%">
	            					<thead>
	            					<tr class="Tex_bill_th" style="font-weight: 800;">
	            						<td class="Tex_bill_td" rowspan="3"></td>
	            						<td colspan="6">농 어민 등으로부터의 매입분에 대한 명세</td>
	            					</tr>
	            					<tr class="Tex_bill_th" style="font-weight: 800;">
	            						<td colspan="2">면세농산물 등을 공급한 농 어민등</td>
	            						<td rowspan="2">건 수</td>
	            						<td rowspan="2">품 명</td>
	            						<td rowspan="2">수 량</td>
	            						<td rowspan="2">매입가액</td>
	            					</tr>
	            					<tr class="Tex_bill_th" style="font-weight: 800;">
	            						<td>성 명</td>
	            						<td>사업자 번호</td>
	            					</tr>
	            					</thead>
	            					<tfoot>
	            					<tr>
	            						<td class="Tex_bill_td"></td>
	            						<td></td>
	            						<td></td>
	            						<td></td>
	            						<td></td>
	            						<td></td>
	            						<td></td>
	            					</tr>
	            					
	            					
	            					<tr class="Tex_bill_th">
	            						<td class="Tex_bill_td"></td>
	            						<td colspan="2">합 계</td>
	            						<td id="ffDealCount"></td>
	            						<td id="ffProName"></td>
	            						<td id="ffCount"></td>
	            						<td id="ffPrice"></td>
	            					</tr>
	            					</tfoot>
	            				
	            				</table>
  				
  				</div>
  				
  				
  				
  				
  				<!-- 하든 면세농산물등/ 제조업면세농산물등 영역!!!!!!!!!!!!! -->
		   <script>/* 버튼 스크립트 */
		        $(function(){
		        	$("#tax2").css("display","none");
		            $(".cho_nav").click(function(){
		            	$(".cho_nav").css("background","#8DABA3");
		            	$(this).css("background","#1B5748");
		            	$(this).css("color","white");
		            });
		        });
		    </script>
			<script type="text/javascript">/* div 히든, 쇼 */
			/* 콤마 찍기 */
			function comma(str) {
				str = String(str);
				return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
			}
			/* 마감취소 */
			function cencelDeadline(){
				$("form").attr("action", "updatdDeadLineCen.vd");
			}
			function showTax1(){
		    	$("#tax2").hide();
		    	$("#tax1").show();
		    };
		    function showTax2(){
		    	$("#tax2").show();
		    	$("#tax1").hide();
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
		 			url:"deemedSearch.vd",
		 			type:"post",
		 			data:{search_ye:search_ye, search_mon1:search_mon1, search_mon2:search_mon2, comCode:comCode},
		 			success: function(data){
		 				console.log(data);
		 				 $("#loading").hide();
		 				var deem=data.deem;
		 				var deemPro=data.deemPro;
		 				var deemOther=data.deemOther;
		 				var deemSlip=data.deemSlip;
		 				console.log(deem);
		 				console.log(deemPro[0].venderName);
		 				console.log(deemOther);
		 				console.log(deemSlip);
	          			$("#termDiv").val(deem.vatTerm);
		 				$("#deemedCode").val(deem.deemedCode);
	                  /* 공급자 리스트  &if 농어민이면 농어민 거래내역+구분표에서 농어민 거래 건수*/
	                  //공급자 리스트들의 매입처수, 건수,매입가액,의제매입세액 계산해줘야함
	                  var $deemProList=$("#deemProList");
	                  var $farm=$("#farm");
	                  var $tbody=$("<tbody>");
	                  $farm.append($tbody);
	                  $deemProList.append($tbody);
	                  var fProCount=0;		//농어민 매입처수
	                  var fCount=0;			//농어민 건수
	                  var fPriceCount=0; 	//농어민 매입가액
	                  var fDeemTaxCount=0;	//농어민 의제매입세액
	                  var ffProCount=0;		//농어민 거래내역표의 상품수량
	                  var index=0;			//농어민 거래내역표의 인덱스번호
	                  for(var key in deemPro){
	                	  var $tr=$("<tr>");
	                	  var $venderNameTd=$("<td>").text(deemPro[key].venderName);
	                	  var $bizRegNumTd=$("<td>").text(deemPro[key].bizRegNum);
	                	  
	                	  //구분표에서 농어민 합계 계산
	                	  if(deemPro[key].bizRegNum.length==14){
	                		  index++;
	                		var $trF=$("<tr>");  
	                		var $venderNameFTd=$("<td>").text(deemPro[key].venderName);
		                	var $bizRegNumFTd=$("<td>").text(deemPro[key].bizRegNum);
	                	  	var $countFTd=$("<td>").text(comma(deemPro[key].numofTxn));
	                	  	var $proNameTd=$("<td>").text(deemPro[key].prodName);
	                	  	var $countFfTd=$("<td>").text(comma(deemPro[key].countFf));
	                	  	var $purchasePriceTd=$("<td>").text(comma(deemPro[key].purchasePrice));
	                	  	var $indexTd=$("<td class='Tex_bill_td'>").text(index);
	                		$trF.append($indexTd);
	                		$trF.append($venderNameFTd);
	                		$trF.append($bizRegNumFTd);
	                		$trF.append($countFTd);
	                		$trF.append($proNameTd);
	                		$trF.append($countFfTd);
	                		$trF.append($purchasePriceTd);
	                		$farm.append($trF);
	                		
	                		fProCount++;//매입처수계산
	                	  	fCount=fCount+deemPro[key].numofTxn;
	                	  	fPriceCount=fPriceCount+deemPro[key].purchasePrice;
	                	  	ffProCount=ffProCount+deemPro[key].countFf;
	                	  	
	                	  }
	                	  
	                	  $tr.append($venderNameTd);
	                	  $tr.append($bizRegNumTd);
	                	  
	                	  $deemProList.append($tr);
	                  }
	                  fDeemTaxCount=Math.floor(fPriceCount*(8/108));
	                  
	                  console.log("농어민 매입처수: "+fProCount);
	                  console.log("농어민 건수: "+fCount);
	                  console.log("농어민 매입가액: "+fPriceCount);
	                  console.log("농어민 공제액: "+fDeemTaxCount);
	                  /* 구분표 농어민 칸 채우기 */
					  $("#fProCount").text(comma(fProCount));	        
					  $("#fCount").text(comma(fCount));	                 
					  $("#fPriceCount").text(comma(fPriceCount));	                 
					  $("#fDeemTaxCount").text(comma(fDeemTaxCount));
					  /* 농어민 거래내역 표에 칸채우기 */
		 			  $("#ffDealCount").text(comma(fCount));
		 			  $("#ffCount").text(comma(ffProCount));
		 			  $("#ffPrice").text(comma(fPriceCount));	
		 				
						/* 구분표에서 deemslip값 계산해서 넣어주기 */
						
						var proCountBill=0;		//신용카드 매입처수 계산서
						var countBill=0; 		//건수 계산서
						var priceCountBill=0;	//매입가액 계산서
						var deemTaxCountBill=0;	//의제매입세액 계산서
						var proCountCard=0;		//신용카드매입처수
						var countCard=0;		//건수 카드
						var priceCountCard=0;	//매입가액 카드
						var deemTaxCountCard=0;	//의제매입세액 카드
						for(var key in deemSlip){
							if(deemSlip[key].bizRegNum.length<=12){
								if(deemSlip[key].evidenceCode=='20'){//계산서
									proCountBill++;//매임처수
									countBill=countBill+deemSlip[key].count1;//건수
									priceCountBill=priceCountBill+deemSlip[key].purchasePrice;
									
								}else if(deemSlip[key].evidenceCode=='60'){//신용카드
									proCountCard++;
									countCard=countCard+deemSlip[key].count1;
									priceCountCard=priceCountCard+deemSlip[key].purchasePrice;
								}
							}
						}
						deemTaxCountBill=Math.floor(priceCountBill*(8/108));
						deemTaxCountCard=Math.floor(priceCountCard*(8/108));
						/* 구분표에 계산서랑 신용카드 값넣기 */
						$("#proCountBill").text(comma(proCountBill));
						$("#countBill").text(comma(countBill));
						$("#priceCountBill").text(comma(priceCountBill));
						$("#deemTaxCountBill").text(comma(deemTaxCountBill));
						$("#proCountCard").text(comma(proCountCard));
						$("#countCard").text(comma(countCard));
						$("#priceCountCard").text(comma(priceCountCard));
						$("#deemTaxCountCard").text(comma(deemTaxCountCard));
						
		 				/* 구분표 합꼐 */
		 				var proCountSum=fProCount+proCountBill+proCountCard;
		 				var countSum=fCount+countBill+countCard;
		 				var priceCountSum=fPriceCount+priceCountBill+priceCountCard;
		 				var deemTaxCountSum=fDeemTaxCount+deemTaxCountBill+deemTaxCountCard;
		 				$("#proCountSum").text(comma(proCountSum));
		 				$("#countSum").text(comma(countSum));
		 				$("#priceCountSum").text(comma(priceCountSum));
		 				$("#deemTaxCountSum").text(comma(deemTaxCountSum));
		 				
		 				/* 면세농산물등 표에 값넣기 */
		 				$("#asmtSum").text(comma(deemOther.asmtSum));
		 				$("#asmtScheduled").text(comma(deemOther.asmtScheduled));
		 				$("#asmtConf").text(comma(deemOther.asmtConf));
		 				$("#targetAmt").text(comma(deemOther.targetAmt));
		 				$("#currPurAmt").text(comma(deemOther.currPurAmt));
		 				$("#dedAmt").text(comma(deemOther.dedAmt));
		 				$("#dedtaxRate").text(deemOther.dedtaxRate);
		 				$("#dedtaxAmt").text(comma(deemOther.dedtaxAmt));
		 				$("#dedtaxSum").text(comma(deemOther.dedtaxSum));
		 				$("#dedtaxScheduled").text(comma(deemOther.dedtaxScheduled));
		 				$("#dedtaxMonth").text(comma(deemOther.dedtaxMonth));
		 				$("#dedTax").text(comma(deemOther.dedTaxrate1));
		 				
		 				
		 				
		 				/* 마감됐을때 버튼 띄우기 */
		 				 if(deem.deadline == 'Y'){
								console.log("마감된 애임")
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
  		<div><!-- 면세농산물등/ 제조업 면세농산물등 -->
  					
  					<div id="total_deemed_div3" style="margin-left: 6px; margin-bottom: 10px;">
	                    <ul class="nav nav-pills">
	                        <li class="click_li"><div class="cho_nav" id="cho_nav1" onclick="showTax1()"><p>면세농산물등</p></div></li>
	                        <li class="click_li"><div class="cho_nav" id="cho_nav2" onclick="showTax2()"><p>제조업면세농산물등</p></div></li>     
	                    </ul>
	  				
		                <div id="tax1">
		                	<div class="middleMenu" style="margin-top: 20px;">
		                    <h5>가.과세기간 과세표준 및 공제가능한 금액등</h5>
		                	</div>
		  					<table  class ="men_ga" style="text-align:center; width: 100%; margin-top: 20px; margin-bottom: 40px; margin-left: auto; margin-right: auto;">
		  						<tr class="Tex_bill_th" style="font-weight: 800;">
		  							<td colspan="3">과세 표준</td>
		  							<td colspan="2">대상액 한도계산</td>
		  							<td rowspan="2">B. 당기매입액</td>
		  							<td rowspan="2">공제대상금액<br>[MIN{A,B}]</td>	
		  						</tr>
		  						<tr class="green">
		  							<td>합계</td>
		  							<td>예정분</td>
		  							<td>확정분</td>
		  							<td>한도율</td>
		  							<td>A.한도액</td>
		  							
		  						</tr>
		  						<tr>
		  							<td class="green_value" id="asmtSum"></td>
		  							<td  id="asmtScheduled"></td>
		  							<td id="asmtConf"></td>
		  							<td>40/100</td>
		  							<td class="green_value" id="targetAmt"></td>
		  							<td id="currPurAmt"></td>
		  							<td class="green_value" id="dedAmt"></td>
		  						</tr>
		  					
		  					</table>
		  					
		  					<div class="middleMenu" style="margin-top: 20px;">
		                    <h5>나.과세기간 공제할 세액</h5>
		                	</div>
		                	<table  class ="men_ga" style="text-align:center; width: 100%; margin-left: auto; margin-right:auto; margin-top: 20px; margin-bottom: 10px;">
		  						<tr class="Tex_bill_th" style="font-weight: 800;">
		  							<td colspan="2">과세 표준</td>
		  							<td colspan="3">대상액 한도계산</td>
		  							<td rowspan="2">공제(납부)할세액액<br>(C-D)</td>
		  						</tr>
		  						<tr class="green">
		  							<td>공제율</td>
		  							<td>C.공제대상금액</td>
		  							<td>D.합계</td>
		  							<td>예정신고분</td>
		  							<td>월별초기분</td>
		  							
		  						</tr>
		  						<tr>
		  							<td id="dedtaxRate"></td>
		  							<td id="dedtaxAmt" style="height: 30px;"></td>
		  							<td id="dedtaxSum" class="green_value"></td>
		  							<td id="dedtaxScheduled"></td>
		  							<td id="dedtaxMonth"></td>
		  							<td id="dedTax" class="green_value"></td>
		  						</tr>
		  					
		  					</table>
		  				</div>
		  				<!-- 제조업면세 농산물등 !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
		  				<div id="tax2">
		  					<div class="middleMenu" style="margin-top: 20px;">
		                    <h5>가.1역년 과세표준 및 제 2기 과세기간 공제 가능한 금액등</h5>
		                	</div>
		  					<table  class ="men_ga" style=" text-align:center; width: 100%; margin-top: 20px; margin-bottom: 40px; margin-left: auto; margin-right: auto;">
		  						<tr class="Tex_bill_th" style="font-weight: 800;">
		  							<td colspan="3">과세 표준</td>
		  							<td colspan="2">대상액 한도계산</td>
		  							<td colspan="3">1역년 매입액</td>
		  							<td rowspan="2">공제대상금액<br>[MIN{A,B}]</td>	
		  						</tr>
		  						<tr class="green">
		  							<td >B.합계</td>
		  							<td>제1기</td>
		  							<td>제2기</td>
		  							<td>한도율</td>
		  							<td>A.한도액</td>
		  							<td>B.합계</td>
		  							<td>제1기</td>
		  							<td>제2기</td>
		  							
		  						</tr>
		  						<tr>
		  							<td class="green_value"></td>
		  							<td></td>
		  							<td></td>
		  							<td style="height: 30px;"></td>
		  							<td class="green_value"></td>
		  							<td class="green_value"></td>
		  							<td></td>
		  							<td></td>
		  							<td class="green_value"></td>
		  						</tr>
		  					
		  					</table>
		  					
		  					<div class="middleMenu" style="margin-top: 20px;">
		                    <h5>나.과세기간 공제할 세액</h5>
		                	</div>
		                	<table  class ="men_ga" style="text-align:center; width: 100%; margin-left: auto; margin-right:auto; margin-top: 20px; margin-bottom: 10px;">
		  						<tr class="Tex_bill_th" style="font-weight: 800;">
		  							<td colspan="2">공제대상세액</td>
		  							<td colspan="5">이미 공제받은 금액</td>
		  							<td rowspan="3">공제(납부)할세액<br>(C-D)</td>
		  						</tr>
		  						<tr class="green">
		  							<td rowspan="2">공제율</td>
		  							<td rowspan="2">C.공제대상금액</td>
		  							<td rowspan="2">D.총 합계</td>
		  							<td rowspan="2">제1기</td>
		  							<td colspan="3">제2기</td>
		  							
		  						</tr>
		  						<tr class="green">
		  							<td>합계</td>
		  							<td>예정신고분</td>
		  							<td>월별조기분</td>
		  						</tr>
		  						<tr>
		  							<td></td>
		  							<td style="height: 30px;"></td>
		  							<td class="green_value"></td>
		  							<td></td>
		  							<td class="green_value"></td>
		  							<td></td>
		  							<td></td>
		  							<td class="green_value"></td>
		  						</tr>
		  					
		  					</table>
		  					
		  				
		  				</div>
  				
  				
  				
  				
  	  			   </div>
	            
   
    </div><!-- 면세농산물등/ 제조업 면세농산물등 끝-->
 </div><!-- 오른쪽 전체 div -->

		<div style="height: 100vh;"></div>
		
 </form>
	
	</main>
	<jsp:include page="../common/menubar2.jsp" />
</body>
</html>