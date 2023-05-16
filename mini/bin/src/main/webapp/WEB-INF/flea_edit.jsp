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
            padding: 24px;
        }

        h1 {
            text-align: center;
        }

        .input_form {
            border: 1px solid #999999;
            border-radius: 10px;
            width: 1100px;
            margin: 50px auto;
            padding: 26px;
            border-radius: 15px;
            border: none;
            box-shadow: 0px 0px 20px 5px #e7e6e6;
        }

        .input_form div {
            margin-top: 16px;
        }

        .input_box {
            border: 1px solid #999999;
            border-radius: 10px;
            padding: 16px;
        }

        .input_box span {
            display: inline-block;
            width: 15%;
            font-size: 18px;
        }

        .title {
            width: 80%;
            border: 1px solid #999999;
            border-radius: 10px;
            height: 40px;
        }

        .file_box {
            border: 1px solid #999999;
            border-radius: 10px;
            padding: 16px;
        }


        .content_box,
        .file_box p {
            font-size: 18px;
        }

        .content {
            width: 100%;
            border: 1px solid #999999;
            border-radius: 10px;
            padding : 16px;
        }

        .btn_box button {
            border: none;
            width: 100px;
            height: 40px;
            margin-left: 16px;
            border-radius: 15px;
            background-color: #999999;
            color: white;
            font-size: 20px;
            font-weight: bold;
        }

        /* style END */
    </style>


    <!-- pageContent -- START -->
    <div id="pageContent">
        <div id="app">
            <div class="wrapper">

                <div class="container">

                    <div>
                        <h1>랜선마켓 등록</h1>
                    </div>

                    <div class="input_form">

                        <div class="category">

                            <select v-model="info.boardKind">
                            	<option value="" selected>글종류</option>
                                <option value="T_LAN">거래</option>
                                <option value="D_LAN">나눔</option>
                            </select>

                        </div>

                        <div class="input_box">

                            <div class="title_box">
                                <span>제목</span> <input class="title" type="text" v-model="info.title">
                            </div>

                        </div>

                        <div class="file_box">

                            <div class="detail_box">
                                <p>첨부파일</p>
                                <form action="">
                                    <input type="file">
                                    <input type="submit">
                                </form>
                            </div>

                        </div>

                        <div class="content_box">
                            <p>내용</p> <textarea class="content" rows="15" v-model="info.content"></textarea>
                        </div>

                        <div class="btn_box">
                            <button @click="fnAddPost" v-if="boardNo==''">등록</button>
                            <button @click="fnDeletePost" v-if="boardNo!=''">삭제</button>
                            <button @click="fnEditPost" v-if="boardNo!=''">수정</button>
                            
                        </div>



                    </div>

                </div>

            </div>

        </div>

    </div>
    <!-- pageContent -- END -->

    <jsp:include page="/layout/tail.jsp"></jsp:include>


    <script type="text/javascript">     

        var app = new Vue({
            el: '#app',
            data: {
                info: {
                		boardKind: "",
                		title: "",
                		content: ""              		
                		
                }, 
                sessionId: "${sessionId}",
                boardNo: "${map.boardNo}"

            },
            methods: {
            	
            	//게시글 수정용 데이터 불러오기
            	fnGetFlea: function () {
                    var self = this;
                    if (self.boardNo == "") {
                    	return;
                    }
                    var nparmap = {
                        boardNo: self.boardNo
                    };
                    $.ajax({
                        url: "/fleamarket/view.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            self.info = data.info;
                            console.log(data.info);
                        }
                    });
                }
            
            	// 게시글 등록
            	, fnAddPost: function () {
                    var self = this;
                    if(!confirm("등록 하시겟습니까?")) {
                    	return;
                    }
                    if(self.info.boardKind == "") {
                    	alert("마켓글 종류를 선택하세요.");
                    	return;
                    }
                    if(self.info.title == "") {
                    	alert("글 제목을 입력하세요.");
                    	return;
                    }
                    if(self.info.content == "") {
                    	alert("글 내용을 입력하세요.");
                    	return;
                    }
                    console.log(self.info);
                    var nparmap = {
                    		sessionId : self.sessionId,
                            boardKind : self.info.boardKind,
                            title : self.info.title,
                            content : self.info.content
                        };
                    $.ajax({
                        url: "/fleamarket/addFlea.dox",
                        dataType: "json",
                        type: "POST",
                        data: nparmap,
                        success: function (data) {
                            alert("등록되었습니다.");
                            location.href = "/flea.do";
                            
                        }
                    });
                }
            	
            	// 게시글 삭제            	
            	, fnDeletePost: function() {
            		var self = this;
            		if (!confirm("게시글을 삭제하시겠습니까?")) {
            			return;
            		};
            		var nparmap = {
                            boardNo : self.boardNo
                        };
            		$.ajax({
                    	url: "/fleamarket/deleteFlea.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("삭제완료");
                    		location.href="/flea.do"
                    	}
                	});
            	}
            	
            	// 게시글 수정
            	, fnEditPost: function() {
            		var self = this;
            		if (!confirm("게시글을 수정하시겠습니까?")) {
            			return;
            		};
            		var nparmap = {
                            boardNo : self.boardNo,
                            boardKind : self.info.boardKind,
                            title : self.info.title,
                            content : self.info.content
                        };
            		$.ajax({
                    	url: "/fleamarket/editFlea.dox",
                    	dataType: "json",
                    	type: "POST",
                    	data: nparmap,
                    	success: function (data) {
                    		alert("수정완료");
                    		location.href="/flea.do"
                    	}
                	});
            	}
				
         		
             	
            }
                ,
                created: function () {
                    var self = this;
                    self.fnGetFlea();
                }
            });
    </script>