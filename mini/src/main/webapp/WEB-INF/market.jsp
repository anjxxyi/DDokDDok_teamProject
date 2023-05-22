<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

<style>
<!-- 페이징 추가 2-->
	.pagination {
        margin:24px;
        display: inline-flex;
        
    }
    ul {
        text-align: center;
    }
	.pagination li {
	    min-width:32px;
	    padding:2px 6px;
	    text-align:center;
	    margin:0 3px;
	    border-radius: 6px;
	    border:1px solid #eee;
	    color:#666;
	    display : inline;
	}
	.pagination li:hover {
	    background: #E4DBD6;
	}
	.page-item a {
	    color:#666;
	    text-decoration: none;
	}
	.pagination li.active {
	    background-color : #E7AA8D;
	    color:#fff;
	}
	.pagination li.active a {
	    color:#fff;
	}
	.style_inline{
		display: inline;
	}
	.mypage{
		
	}
	
	
	
	
	
     /* style START */
     body {
           /* background: url("/images/sub_dept3-1_smart_Eating_view") no-repeat;*/
        }
        
        
                
                                
                
        .recipe-img {
            border-radius: 5px;
            width : 58%;
            height: 500px;
            margin-right: 30px;
        }
        .big-box {
            width: 42%;
            margin-bottom: 60px;
        }
        
        .recipe-info {
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 35px;
            padding: 20px 20px;
            margin-bottom: 30px;

            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 420px;
        }
        .recipe-info div {
            margin-right: 10px;
        }
        .recipe-save {
            display: flex;
            justify-content: space-between;
        }
        .recipe-info-box {
            display:flex;
            margin: 50px 0px;
            width: 100%;
        }

        @media screen and (max-width: 512px) {
            .recipe-info-box {
            display: block;
            margin: 50px 0px;
            width: 100%;
            }
            .recipe-img {
            width : 100%;
            height: auto;
            }
            .big-box {
            width: 100%;
            height: auto;
            margin-bottom: 60px;
            }

        }
        

       .re-icon {
            width:50px;
            text-align: center;
       }
       .recipe-simple-info {
             display: flex;
             justify-content: center;
             margin-top: 60px;
       }
      
       .box2 {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            width: 110px;
            margin: 0 10px;
       }
      
       .box2 div {
            font-size: large;
       }
       .recipe-name {
        margin-left: 40px;
        margin-bottom: 30px;
       }
       .recipe-name > div:last-child {
            margin-top: 5px;
          font-size:x-large;
       }
       .recipe-save-button {
            width: 68%;
            height: 55px;
            padding : 10px;
            font-size: large;
            border-radius: 15px;
            color:white;
            background-color: green;
            border-color: green;
       }
       .icon-print {
            width: 55px;
            height: 55px;
            background-color: black;
            border-radius: 10px;
            text-align: center;
            padding:15px 0px;
       }
       .icon-share {
            width: 55px;
            height: 55px;
            background-color: whitesmoke;
            border: 1px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 5px 0px #ece9e9;
            border-radius: 10px;
            text-align: center;
            padding:15px 0px;
       }
       .color-white {
            color: whitesmoke;
       }
       .ingre-name {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: large;
            margin-bottom: 20px;
        }
        .ingredient {
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 35px;
            padding: 20px 40px;
            margin-bottom: 30px;
            width: 100%;
        }
        .ingredient .ingre-info {
            margin-left: 50px;
        }
        .recipe-index {
            display: flex;
            margin-bottom: 30px;
        }
        .img-index {
            width: 60%;
        }
        .text-index {
            width : 40%;
            margin-left: 20px;
            margin-bottom: 20px;
            font-size: large;
            display: flex;
            flex-direction: column;
            justify-content: end;
        }

        @media screen and (max-width: 512px) {
            .recipe-index {
            display: block;
            }
            .img-index {
                width: 100%;
            }
            .text-index {
                width: 100%;
            }
        }
        #wrapper{
            width: 1200px;
            
            /*border: 1px solid #ccc;*/
           /* background-image: url(/images/smart_market.jpg);*/
            
            background-position: center;
            opacity: 1;  
        }
        .smart_market{
            display: flex;
        }
        .circle{
            margin: 5px;
            background-color: #ccc;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            box-shadow: 1px 1px 5px 1px gray;            
            /*그림자주기 1위치(좌우) 2.위치(상하) 3흐리기 4크기 5색깔*/
        }
        .box{
            margin: 5px;
            background-color: #beb6b6;
            width: 210px;
            height: 220px;
        }
        
        
        /*정렬*/
        #box1{
            margin-top: 50px;
            align-items: flex-start;
            justify-content: space-evenly;            
        }

        #box2{
            align-items: flex-start;
            justify-content: space-evenly;
            gap: 10px;
        }

        #box3{
            margin-top: 10px;
            align-items: flex-start;
            justify-content: space-evenly;
            gap: 10px;
        }

        #box4{
            display: flex;
            margin-top: 10px;
            align-items: flex-start;
            justify-content: space-evenly;            
            gap: 10px;
        }
        .box4{
            margin: 2px;
            
            background-color: #f1eee8;
            width: 210px;
            height: 100px;
            text-overflow:ellipsis;
        }
        .recommendtitle{
        	font-size:1.125em; text-align:left; word-break:keep-all; overflow:hidden; text-overflow:ellipsis; display:-webkit-box; 
        	-webkit-line-clamp:2; -webkit-box-orient:vertical;
        }
        .gap1{
            border: 1px;
            width: 100px;
            height: 30px;
            text-align: center;
            font-size: 18px;
        }
        .recommend{
            margin-top: 80px;
            font-size: 23px;
            font-weight: bold;
            /*background-color: #777;*/
        }
        .product_list{
            display: flex;
            position: relative;/*상위 기준으로 상대적 위치를 갖는다.*/
        }
        .product_vege{
            margin-top: 50px;
            font-size: 23px;
            font-weight: bold;
            /*background-color: #777;*/
            width: 80%;
        }
        .product_vege_cnt{
            width: 10%;
            
            padding-right: 5px;
            /*background-color: #ccc;*/
            position: absolute; /*브라우저를 기준으로 고정*/
            right: 2px;
            bottom: 1px;
        }
		.smart_market1{
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));/*auto-fit, auto-fill*/
            /*grid-gap: 10px; /*그리드의 간격을 준다*/
            grid-gap: 1rem; /*그리드의 간격을 준다 / 1rem : 16px*/
            height:100%;
        }
        .star{
            width: 20px;
        }
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <!-- wrap START -->
         
            <div id="app">
	                  
				<div class="add_box">
                    <button class="add_btn" v-if="sessionStatus == 'A'" @click="fnAddproduct">등록</button>
                </div>            
                <div class="smart_market" id="box1">
                    <div v-for="(item, index) in codeList"><a href="javascript:;" id="veg"><img :src="item.img" class="circle" @click="fnGetList2(item)"></a></div>
                </div>
                <div class="smart_market" id="box2">
                    <div v-for="(item, index) in codeList" class="gap1"><p><a href="javascript:;" @click="fnGetList2(item)" id="veg1">{{item.name}}</a></p></div>
                </div>
                <div class="recommend"><P>추천상품</P></div>
                <div class="smart_market" id="box3">
                    <div v-for="(item2, index) in list2">
                    	<a href="javascript:;" @click="fnView(item2.productNo)">
	                        <img :src="item2.imgPath" class="box">
	                        <div class="box4">
	                            <p v-if="item2.productStock>5"></p>
	                            <p v-else-if="item2.productStock>0 && item2.productStock<=5">현재 5개 남았어요!</p>
	                            <p v-else>품절</p>
	                            <h4 class="recommendtitle" >{{item2.productName}}</h4>
	                            <p>{{item2.productPrice | numberFormat()}}원 (100{{item2.productVolume}}당 {{item2.productPrice*100 / item2.productWeight*item2.productEa | numberFormat()}}원)</p>
	                            <p><img class="star" src="images/star.png"> {{(item2.satisfactionGrade + item2.repurchaseGrade + item2.deliveryGrade)/3 |  numberFormat(1)}} </p>
	                        </div>
                        </a>
                    </div>            
                </div>
                
        
                <div class="product_list">
                    <div class="product_vege" >
                        <P>상품목록 : <span id="title_list">{{pkind}}</span></P>	                
                    </div>
                    <div class="product_vege_cnt"><P id="pro_cnt">총 {{product_cnt}}개 상품</P></div>
                </div>
                
                
				
	                <div class="smart_market1" id="box3" >
	                	
		                    <div v-for="(item, index) in list">		                    
		                        <a v-if="item.productStock == 0"  style="opacity: 0.5;">
		                            <img :src="item.imgPath" class="box">
		                            <div class="box4">
		                                <p v-if="item.productStock>5" style="imageObject.disabled"></p>
			                            <p v-else-if="item.productStock>0 && item.productStock<=5">현재 5개 남았어요!</p>
			                            <p v-else>품절</p>
		                                <h4 class="recommendtitle" >{{item.productName}}</h4>
		                                <p>{{item.productPrice | numberFormat()}}원 (100{{item.productVolume}}당 {{item.productPrice*100 / item.productWeight*item.productEa | numberFormat()}}원)</p>
		                                <p><img class="star" src="images/star.png"> {{(item.satisfactionGrade + item.repurchaseGrade + item.deliveryGrade)/3 |  numberFormat(1)}} </p>
		                            </div>
		                        </a>
		                        <a v-else href="javascript:;" @click="fnView(item.productNo)">
		                            <img :src="item.imgPath" class="box">
		                            <div class="box4">
		                                <p v-if="item.productStock>5"></p>
			                            <p v-else-if="item.productStock>0 && item.productStock<=5">현재 5개 남았어요!</p>
			                            <p v-else>품절</p>
		                                <h4 class="recommendtitle" >{{item.productName}}</h4>
		                                <p>{{item.productPrice | numberFormat()}}원 (100{{item.productVolume}}당 {{item.productPrice*100 / item.productWeight*item.productEa | numberFormat()}}원)</p>
		                                <p><img class="star" src="images/star.png"> {{(item.satisfactionGrade + item.repurchaseGrade + item.deliveryGrade)/3 |  numberFormat(1)}} </p>
		                            </div>
		                        </a>
		                    </div>
		                    

			            
		                    
					</div>
				<!-- 페이징 추가 3-->
							<template>
							  <paginate
							    :page-count="pageCount"
							    :page-range="3"
							    :margin-pages="2"
							    :click-handler="fnSearch"
							    :prev-text="'<'"
							    :next-text="'>'"
							    :container-class="'pagination'"
							    :page-class="'page-item'">
							  </paginate>
							</template>
				
					
					
					
                              
                
            </div>
        
        <!-- wrap END -->
		
	
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">

<!-- 페이징 추가 4-->
Vue.component('paginate', VuejsPaginate)    
    
    
    
    var app = new Vue({ 
    el: '#app',
    data: {
		list : [],
		list2 : [],
		codeList : ${map.codeList},
		product_cnt : "",		
		pkind : "전체",
		product_kind : "",
		sessionStatus : "${sessionStatus}"
		
        	<!-- 페이징 추가 5-->
		, selectPage: 1
		, pageCount: 1
		, cnt : 0		
		
    }
	, filters: {
	    numberFormat: (value, numFix) => {
	        value = parseFloat(value);
	        if (!value) return '0';
	        return value.toFixed(numFix).replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
	    },
	}
    , methods: {
    	fnGetList : function(){
    		var self = this;
    		//var nparmap = {product_kind : self.product_kind};
    		
    		
    		
    		<!-- 페이징 추가 6-->
			var startNum = ((self.selectPage-1) * 15);
    		var lastNum = (self.selectPage * 15)
    		var nparmap = {keyword : self.keyword
    						, kind : self.selectItem
    						, startNum : startNum
    						, lastNum : lastNum
    						, product_kind : self.product_kind
    						, productNo : self.productNo};
    		
    		console.log(nparmap);
    		
    		//상품리스트
    		$.ajax({
                url:"/smartmarket-list.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	
                	self.product_cnt = data.list.length;
                	self.list = data.list;
                	self.cnt = data.cnt;
	                self.pageCount = Math.ceil(self.cnt / 15);
	                
	                console.log("==============",data);
                }
            });

    	}
	    , fnView : function(productNo){
	    	var self = this;	    	
	    	self.pageChange("/market/view.do", {productNo : productNo});
		}
	    , fnGetList2 : function(item){
			var self = this;
			
			self.product_kind = item.code;
			self.pkind = item.name;
			self.fnGetList();
		}
	    
	    ,fnGetList3 : function(){
    		var self = this;
    		var nparmap = {product_kind : self.product_kind};
    		
    		//추천상품
    		$.ajax({
                url:"/smartmarket-recommend-list.dox",
                dataType:"json",
                type : "POST",
                data : nparmap,
                success : function(data) {
                	console.log(data.list);
                	self.list2 = data.list;
                }
            });    		
    		
    		
    	}
	    , pageChange : function(url, param) {
    		var target = "_self";
    		if(param == undefined){
    		//	this.linkCall(url);
    			return;
    		}
    		var form = document.createElement("form"); 
    		form.name = "dataform";
    		form.action = url;
    		form.method = "post";
    		form.target = target;
    		for(var name in param){
				var item = name;
				var val = "";
				if(param[name] instanceof Object){
					val = JSON.stringify(param[name]);
				} else {
					val = param[name];
				}
				var input = document.createElement("input");
	    		input.type = "hidden";
	    		input.name = item;
	    		input.value = val;
	    		form.insertBefore(input, null);
			}
    		document.body.appendChild(form);
    		form.submit();
    		document.body.removeChild(form);
    	}
	 	// 상품 등록
      	, fnAddproduct : function(){
    		location.href = "/market/edit.do";
    	}

	 	
        <!-- 페이징 추가 7-->
		, fnSearch : function(pageNum){
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((pageNum-1) * 15);
			var lastNum = (pageNum * 15) + 1;
			var nparmap = {startNum : startNum, lastNum : lastNum, productNo : self.productNo};
			
			console.log(nparmap);
			
			$.ajax({
				url : "/smartmarket-list.dox",
				dataType : "json",
				type : "POST",
				data : nparmap,
				success : function(data) {
					
					self.list = data.list;
					self.cnt = data.cnt;
					self.pageCount = Math.ceil(self.cnt / 15);
				}
			});
		}	 	
	 	
	 	
    }   
    , created: function () {
    	var self = this;
    	self.fnGetList();
    	self.fnGetList3();
	}
});

   

</script>
