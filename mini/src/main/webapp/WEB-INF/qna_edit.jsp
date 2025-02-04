<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/layout/head.jsp"></jsp:include>
<jsp:include page="/layout/includePageVisual.jsp"></jsp:include>


<style>
      .wrapper h1 { text-align: center;  }
      .wrapper fieldset { width: 100%;height: auto; border: 5px solid rgba(245, 243, 243, 0.959);box-shadow: 2px 2px 20px 0px #ece9e9; border-radius: 10px; padding: 20px 30px;margin: 40px 0; }
      .wrapper fieldset li {display: flex; margin: 20px 5px; }
      .wrapper fieldset .enrol-re {float: left; width: 100px;font-weight: bold;  }
      .recipe-file { display: flex; }
      .wrapper fieldset > li > #boarde_name, #content {  border-radius: 5px;  width: 100%; }
      .wrapper fieldset > li > #no_btn {  border-radius: 5px;  width: 15%; }
      .enrol-no {border-radius: 5px; width : 30%;}
      .btn_box button { border: none; width: 100px;height: 40px; margin-left: 16px; border-radius: 15px;background-color: #999999;color: white;font-size: 20px;font-weight: bold;}
      #add-area { text-align: center;margin:10px 0; }
      #add-area #add-btn { border: none;background: none;padding:5px;font-size: medium;}
      #step-num{margin-right: 30px;}
      #re-info {margin-bottom: 20px;}
      #re-img { display: flex; }
      #recipe-step label {float: left; width: 130px; }
      .btn:hover {  cursor: pointer; }
</style>


<div id="pageContent">
	<div class="wrapper" id="qnaEdit">
         <h1>문의 등록</h1>
         <fieldset>
               <li>
                   <label for="board_name" class="enrol-re">제목</label>
                   <input id="boarde_name" name="board_name" type="text" v-model="info.title" required >
               </li>
               <li>
                  <label for="file1" class="enrol-re">첨부파일</label>
                  <form action="">
                      <input type="file" id="file1" name="file1">
                  </form>
              </li>
               <li>
                  <label for="board_content" class="enrol-re">내용</label> 
                  <div id="content">
                		 <vue-editor v-model="info.content"></vue-editor>
                  </div>
               </li>
           </fieldset>
 
           <div class="btn_box">
             <button class="btn" @click="fnEnroll()">등록</button>
          </div>
   	</div>
</div>


<jsp:include page="/layout/tail.jsp"></jsp:include>


<script type="text/javascript">
	//3. 뷰에 vue2editor 추가
	console.log(Vue);
	Vue.use(Vue2Editor);
	const VueEditor = Vue2Editor.VueEditor;
	
    var qnaEdit = new Vue({ 
    el: '#qnaEdit',
    data: {
    	info : {
    		boardNo : "${boardNo}"
    		,userId : "${sessionId}"   
   	    	,title : ""
   	    	,content : ""
   	    	,cdatetime: ""
   	    	,category : 1
    	},
        cnt : 1,
        content : "",
        boardNo : "${map.boardNo}",
        sessionStatus : "${sessionStatus}",
    }
    // 4. 컴포넌트 추가
    , components: {VueEditor}
    , methods: {
    	// 수정할 글 불러오기
    	 fnGetInfo : function(){
	            var self = this;
	            if(self.boardNo == "") {
	            	return;
	            }
	            var nparmap = {boardNo : self.boardNo};
	            // 레시피 설명
	            $.ajax({
	                url:"/qna/view.dox",
	                dataType:"json",
	                type : "POST",
	                data : nparmap,
	                success : function(data) {
	                	console.log(data.info);
	                    self.info = data.info;
	                }
	            });
	
	        }
    	// 커뮤니티 글 등록
        ,fnEnroll : function() {
            var self = this;
            // 관리자가 작성한 글이면 공지글로
            if (self.sessionStatus=='A') {
            	self.info.category = 2;
            }
            // 작성일이 있다면 수정 함수 호출
            if (self.info.cdatetime) {
            	self.fnModify();
            	return;
            }
            if (!self.info.title) {alert("문의 제목을 입력해주세요."); return;}
            if (!self.info.content) {alert("문의 내용을 입력해주세요."); return;}
            
            var nparmap = self.info;
	        $.ajax({
	            url:"/qna/save.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data);
	            	alert("등록되었습니다!");
	            	
	            	var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "boardNo",  data.boardNo); // pk
	       	     	if (form.file1) {
	       	     		self.upload(form); 
	       	     	}
	           		
	           	 	location.href="/qna.do";
	            }
	        }); 
        }
     // 커뮤니티 글 수정
        , fnModify : function() {
            var self = this;
            var nparmap = self.info;
            if (!self.info.title) {alert("문의 제목을 입력해주세요."); return;}
            if (!self.info.content) {alert("문의 내용을 입력해주세요."); return;}
	        $.ajax({
	            url:"/community/modify.dox",
	            dataType:"json",	
	            type : "POST", 
	            data : nparmap,
	            success : function(data) {  
	            	console.log(data);
	            	alert("수정되었습니다!");
	            	
	            	var form = new FormData();
	       	        form.append( "file1",  $("#file1")[0].files[0] );
	       	     	form.append( "boardNo",  data.boardNo); // pk
	       	     	if (form.file1) {
	       	     		self.upload(form); 
	       	     	}
	           		
	           	 	location.href="/qna.do";
	            }
	        }); 
        },
        // 파일 업로드
	    upload : function(form){
	    	var self = this;
	        
	         $.ajax({
	             url : "/community/fileUpload.dox"
	           , type : "POST"
	           , processData : false
	           , contentType : false
	           , data : form
	           , success:function(response) { 
	        	   
	           }
	           
	       });
		}
		
    } // 메소드 end
    , created: function () {
		var self = this;
		self.fnGetInfo();
	}
});

</script>
