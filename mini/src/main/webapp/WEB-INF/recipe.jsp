<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>



<style>
	  /* style START */
        
        /* 페이징 추가2 */
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
	    /* 페이징 추가 끝 */
        #wrapper {
            text-align: center;
        }
        .category-circle {
            width:100px;
            height: 100px;
            border-radius: 50%;
            background: rgba(232, 227, 227, 0.959);
            /* margin-bottom: 20px; */
        }
        .category-circle:hover {
            background: #bdee71;
        }
        .r-category {
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
        }
        .box1 {
            text-align: center;
            margin: 0 25px;
            cursor: pointer;
        }

        @media screen and (max-width: 512px) {
            .box1 {
            text-align: center;
            margin: 0px 18px;
           }
           .box1 > div:last-child {
            margin: 0;
           }
        }

        .r-search {
            margin-top: 150px;
            margin-bottom: 70px;
        }
        .r-input {
            width: 40%;
            border : none;
            border-bottom: 1px solid black;
            padding-left: 30px;
            font-size: 18px;
            text-align: left;
            
        }

        @media screen and (max-width: 512px) {
            .r-input {
            width: 90%;
            padding-left: 0px;
            }
            .category-img {
            width: 30px;
            height: 30px;
            background-color: white;
            }
        }
            
        .c-icon {
            position:relative;
            bottom: 60px;
            
        }
        .search-icon {
            position: relative;
            right:30px;
            cursor: pointer;
        }
        .detail-category {
            border: 5px solid rgba(245, 243, 243, 0.959);
            box-shadow: 2px 2px 20px 0px #ece9e9;
            border-radius: 10px;
            padding: 20px 30px;
            margin-bottom: 70px;
        }
        .box2 {
            display: flex;
            padding: 20px;
        }
        .box2 div {
            margin-right: 50px;
            font-size: 20px;
        }
        .box2 a {
            margin-right: 20px;
            font-size: 20px;
        }
        .box2 a:hover {
            background-color: #bdee71;
        }

        @media screen and (max-width: 512px) {
            .box2 {
            display: block;
            }
            .box2 div {
            margin-right: 0;
            font-size: 20px;
            }
            .box2 a {
                display: flex;
                flex-direction: column;
                margin-right: 0px;
            }
        }
        .recipe-img {
            width:380px;
            height: 280px;
            margin-bottom: 10px;
        }
        .search-result-s {
            display: flex;
            justify-content:space-between;
            margin-bottom: 5px;
            font-weight : bold;
        }
        .search-result-s > div:first-child {
            font-size: 20px;
        }
        .search-result-s > div:last-child {
            font-size: 15px;
            position: relative;
            right:40px;
        }
         .r-text {
            font-size: 20px;
            font-weight: bold;
        }
        @media screen and (max-width: 512px) {
            .item-list {
            display: block;
            }
            .item {
            margin-bottom: 30px;
            }
            .recipe-img {
            height: auto;
        	}
        }
        .item-list {
            display: grid;
            grid-template-columns: repeat(3,1fr);
            grid-template-rows: repeat(3,400px);
        }
        .item-list div {
            margin-right: 15px;
        }
       
        .item {
            text-align: left;
            cursor: pointer;
        }
        .add_btn {
            float: left;
            margin-top: -220px;
            border: none;
            width: 100px;
            height: 40px;
            border-radius: 15px;
            background-color: #999999;
            color: white;
            font-size: 20px;
        }
        .add_btn:hover {
        	cursor: pointer;
        }
        .re-view-cnt {
            display: inline-block;
            position: relative;
            left:285px;
            top:270px;
            padding: 3px 10px;
            color:white;
            background-color: rgba(16, 15, 15, 0.612);
            border-radius: 10px;
        }
       
        /* style END */
</style>


<!-- pageContent -- START -->
<div id="pageContent">
	<div class="wrapper">
		 <!-- wrap START -->
    <div id="wrapper">
    	<div id="app">
    	
         <button class="add_btn" @click="fnGoEdit()">등록</button>
        <div class="r-search">
            <input type="text" placeholder="원하는 재료나 레시피를 다양하게 검색해 보세요!" class="r-input">
            <i class="search-icon fa-solid fa-magnifying-glass fa-lg"></i>
        </div>
        <div class="r-category" @click="fnGetRecipeAll()">
            <div class="box1" id="all-btn">
                <div class="category-circle"></div>
                <i class="c-icon fa-solid fa-utensils fa-2xl"></i>
                <div>전체</div>
            </div>
            <div class="box1" id="purpose-btn">
                <div class="category-circle"></div>
                <i  class="c-icon fa-solid fa-bowl-food fa-2xl"></i>
                <div>목적</div>
            </div>
            <div class="box1" id="howto-btn">
                <div class="category-circle"></div>
                <i class="c-icon fa-solid fa-fish-fins fa-2xl"></i>
                <div>방법</div>
            </div>
            <!-- <div class="box1">
                <div id="all-btn" class="category-img"></div>
                <i class="c-icon fa-solid fa-egg fa-2xl"></i>
                <div>재료</div>
            </div> -->
            <div class="box1" id="tool-btn">
                <div  class="category-circle"></div>
                <i class="c-icon fa-solid fa-kitchen-set fa-2xl"></i>
                <div>도구</div>
            </div>
        </div>
        <div class="detail-category">
            <div id="purpose" class="box2">
                <div><b>목적별</b></div>
                <a v-for="(item, index) in codeList" v-if="item.kind=='R_PURPOSE'" href="#" class="each" @click="fnGetRecipeListPur(item)">{{item.name}}</a>
            </div>
            <hr class="line">
            <div id="howto" class="box2">
                <div><b>방법별</b></div>
                <a v-for="(item, index) in codeList" v-if="item.kind=='HOWTO'" href="#" class="each" @click="fnGetRecipeListHow(item)">{{item.name}}</a>
            </div>
            <hr class="line">
            <div id="tool" class="box2">
                <div><b>도구별</b></div>
                <a v-for="(item, index) in codeList" v-if="item.kind=='TOOL'" href="#" class="each" @click="fnGetRecipeListTool(item)">{{item.name}}</a>
            </div>
        </div>
        <div>
            <div class="search-result-s">
            	<div>
            		<span>검색결과 : </span>
            	<!-- <span><input v-model="sResult"></span> -->	
            		<span>{{rkind}}</span>
            	</div>
                
                <div>총 {{cnt}}개의 레시피</div>
            </div>
            
            <div class="item-list" >
                <div class="item" v-for="(item, index) in list" @click="fnView(item.recipeNo)" >
                    <div>
                        <div class="re-view-cnt">
                            <i class="fa-solid fa-eye fa-lg"></i>
                            <span>365</span>
                        </div>
                        <img class="recipe-img" :src="item.imgPath">
                    </div>
                    <div>#레시피 #뭐먹지 #마시따</div>
                    <div class="r-text">{{item.recipeName}}</div>
                </div>
            </div>
            
            <!-- 페이징 추가3 -->
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
​
            
        </div>

   		</div>
    <!-- wrap END -->
		
		</div>
	</div>
</div>
<!-- pageContent -- END -->

<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	Vue.component('paginate', VuejsPaginate)
	 
	var app = new Vue({ 
	el: '#app',
	data: {
		 list: [],
		 cnt : 0,
		 codeList : ${map.codeList},
		 rkind : "전체",
		 recipe_code : "",
		 // 페이징 추가5
		 selectPage : 1,
		 pageCount : 1
	}, methods: {
		// 전체 레시피 리스트 가져오기
		fnGetRecipeAll : function() {
			var self = this;
			self.rkind = "전체";
			// 페이징 추가6
			var startNum = ((self.selectPage-1) * 12);
			var nparmap = {startNum : startNum};
			$.ajax({
				url: "/recipe/all.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.list.length;
					 console.log(self.list);
					 self.pageCount = Math.ceil(self.cnt / 12);
				}
			})
		}
		// 페이징 추가7
		,fnSearch : function(pageNum) {
			var self = this;
			self.selectPage = pageNum;
			var startNum = ((self.selectPage-1) * 12);
			var nparmap = {startNum : startNum};
			$.ajax({
				url: "/recipe/all.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.list.length;;
					 self.pageCount = Math.ceil(self.cnt / 12);
				}
			})
			
		} 
		// 목적별 리스트 가져오기
		,fnGetRecipeListPur : function(item) {
			var self = this;
			self.recipe_code = item.code;
			self.rkind = item.name;
			
			var nparmap = {recipe_code : self.recipe_code};
			$.ajax({
				url: "/recipe/list/purpose.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.list.length;
				}
			})
		}
		// 방법별 리스트 가져오기
		,fnGetRecipeListHow : function(item) {
			var self = this;
			self.recipe_code = item.code;
			self.rkind = item.name;
			console.log(self.recipe_code);
			console.log(self.rkind);
			
			var nparmap = {recipe_code : self.recipe_code};
			$.ajax({
				url: "/recipe/list/howto.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.list.length;
				}
			})
		}
		// 도구별 리스트 가져오기
		,fnGetRecipeListTool : function(item) {
			var self = this;
			self.recipe_code = item.code;
			self.rkind = item.name;
			
			var nparmap = {recipe_code : self.recipe_code};
			$.ajax({
				url: "/recipe/list/tool.dox",
				dataType: "json",
				type: "POST",
				data : nparmap,
				success : function(data) {
					 self.list = data.list;
					 self.cnt = data.list.length;
                     console.log(self.list);
				}
			})
		}
	   // 레시피 등록 페이지 이동
	   ,fnGoEdit : function() {
			location.href = "recipe/edit.do";
	   }
		// 레시피 상세 페이지 이동
		,fnView : function(recipeNo) {
			var self = this;	
			console.log(recipeNo);
	    	self.pageChange("/recipe/view.do", {recipeNo : recipeNo});
		}
		// 페이지 전환
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
	} 
	, created: function () {
		var self = this;
		self.fnGetRecipeAll();
		console.log(self.codeList);
	}
	
	});
	
	$(function () {
	    $("#all-btn").on("click", function() {
	        $("#purpose").show();
	        $("#howto").show();
	        $("#tool").show();
	        $(".line").show();
	    })
	})
	$(function () {
	    $("#purpose-btn").on("click", function() {
	        $("#purpose").show();
	        $("#howto").hide();
	        $("#tool").hide();
	        $(".line").hide();
	    })
	})
	$(function () {
	    $("#howto-btn").on("click", function() {
	        $("#purpose").hide();
	        $("#howto").show();
	        $("#tool").hide();
	        $(".line").hide();
	    })
	})
	$(function () {
	    $("#tool-btn").on("click", function() {
	        $("#purpose").hide();
	        $("#howto").hide();
	        $("#tool").show();
	        $(".line").hide();
	    })
	})  
</script>
