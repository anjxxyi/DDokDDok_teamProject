<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <jsp:include page="/layout/head.jsp"></jsp:include>
    <jsp:include page="/layout/includePageVisual.jsp"></jsp:include>

    <style>
        /* style START */
        /* * {
        border: 1px dotted rgb(223, 60, 141);
    } */

        .container {
            width: 1200px;
            position: relative;
            margin: auto;
        }

        .box1 {
            width: 1200px;
            margin: auto;
            margin-top: 20px;
        }

        .box2 {
            display : flex;
        	flex-direction: column;
    		align-items: center;
            width: 1200px;
            margin-top: 80px;
            max-height: 700px;
            overflow:hidden;
        }

        .fund_img {
            float: left;
        }

        .fund_img img {
            border: 1px solid #e7e6e6;
            border-radius: 20px;
            width: 500px;
            height: 500px;
        }

        .fund_content {
            width: 650px;
            height: 400px;
            margin-right: 0px;
            padding: 40px 30px;
            border: none;
            border-radius: 20px;
            box-sizing: border-box;
            float: right;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .fund_summary {
            margin-top: 30px;
            font-size: 15px;
        }

        .fund_cnt {
            display: inline-block;
            margin-top: 30px;
            font-size: 15px;
        }

        .fund_progress {
            width: 589px;
            height: 20px;
        }

        .price_box {
            margin-top: 15px;
            font-size: 20px;
        }

        .fund_price {
            font-size: 30px;
            font-weight: bold;
            color: #5ea152;
        }

        .apply_button {
            width: 540px;
            height: 80px;
            margin-top: 20px;
            margin-left: 49px;
            border-radius: 15px;
            background-color: #5ea152;
            border: none;
            font-size: 20px;
            color: white;
            font-weight: bold;
            cursor : pointer;
        }

        .share_button {
            width: 85px;
            height: 80px;
            margin-top: 20px;
            margin-left: 26px;
            border-radius: 15px;
            float: right;
            background-color: white;
            border: none;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
            color: #5ea152;
            cursor : pointer;
        }

        .show_button {
            width: 1200px;
            height: 60px;
            margin-top: 20px;
            border-radius: 15px;
            background-color: white;
            border: 1px solid #5ea152;

        }

        #button_box1 {
            display: block;
        }

        #button_box2 {
            display: none;
        }


        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">
				<button @click="fnEditFunding(info.fundingNo)">수정</button>
                <div class="container">

                    <div class="box1">
                        <div class="fund_img"><img :src="info.imgPath"></div>

                        <div class="fund_content">
                            <h1 class="fund_name">{{info.fundingName}}</h1>
                            <p class="fund_summary">{{info.fundingSummary}}</p>
                            <span class="fund_cnt">{{info.fundingGoalCnt}}명 중 {{info.cnt}}명</span>
                            <span class="fund_cnt" id="fund_cnt" style="float: right;">{{info.dDay}}일 남음</span>
                            <p></p>
                            <progress :value="info.cnt" :max="info.fundingGoalCnt" class="fund_progress"></progress>
                            <div class="price_box">
                                <span>공구가</span>
                                <span class="fund_price">{{info.fundingPrice2}}원</span>
                            </div>
                        </div>

                        <div>
                            <button class="apply_button" @click="fnApply">신청하기</button>
                            <button class="share_button" @click="fnClip"><i class="fa-solid fa-share-nodes fa-2xl"></i></button>
                        </div>
                    </div>

                    <div class="box2" id="box2">
						<div id="detail_box" v-for="(item, index) in imgInfo">
	                        <img :src="item.imgPathDetail">
	                    </div>
					</div>

                    <div id="button_box1">
                        <button @click="show" class="show_button" id="show_button">펼쳐보기</button>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">
    	var btn = "N";
        function show() {
        	if(btn == "N"){
        		self.btn = "Y";
        		document.getElementById('box2').style.maxHeight = '100%';
            	show_button.innerText = "접기";
            	
        	} else {
        		document.getElementById('box2').style.maxHeight = '700px';
            	show_button.innerText = "펼쳐보기";
            	self.btn = "N";
        	}
        }

        var app = new Vue({
            el: '#app',
            data: {
                info: {},
                imgInfo: [],
                fundingNo: "${map.fundingNo}",
                sessionId: "${sessionId}",
                btn: "N"

            },
            methods: {
                fnGetFunding: function () {
                    var self = this;
                    var nparmap = {
                        fundingNo: self.fundingNo
                    };
                    $.ajax({
                        url: "/funding/view.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.info = data.info;
                            self.imgInfo = data.imgInfo;
                            console.log(data.info);
                            console.log(data.imgInfo);

                            if (data.info.dDay <= 0) {
                                fund_cnt.innerText = "종료임박 금일 " + data.info.endTime + "시 종료";

                            }
                        }
                    });
                }
				
         		// 주소 복사
                , fnClip: function () {
                    navigator.clipboard.writeText(window.location.href);
                    alert("복사되었습니다.");
                }

            	// 펀딩 신청
                , fnApply: function () {
                    var self = this;
                    if (self.sessionId == "") {
                    	alert("로그인을 해주세요");
                    	return;
                    }
                    if (!confirm("펀딩을 신청하시겠습니까?")) {
                        return;
                    }
                    var nparmap = {
                            fundingNo: self.fundingNo
                            , sessionId: self.sessionId
                        };
                        $.ajax({
                            url: "/funding/apply.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {  
                            	console.log(data.result);
                            	alert(data.message);
                            }
                        });

                }
            	
             	// 펀딩신청 중복검사용 카운트
                , cnt: function () {
                    var self = this;
                    var nparmap = {
                            fundingNo: self.fundingNo
                            , sessionId: self.sessionId
                        };
                        $.ajax({
                            url: "/funding/cnt.dox",
                            dataType: "json",
                            type: "POST",
                            data: nparmap,
                            success: function (data) {  
                            	console.log(data);
                            	
                            }
                        });

                }
             	
             	// 펀딩 수정
            	, fnEditFunding: function(fundingNo) {
            		var self = this;
            		console.log(fundingNo);
            		confirm("rr?");
            		
            		self.pageChange("../../funding/edit.do", {fundingNo : fundingNo});
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
             	
             	
            }
            ,
            created: function () {
                var self = this;
                self.fnGetFunding();
            }
        });
    </script>