<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="w-50">
		<h1>글쓰기</h1>
		
		<input type="text" id="subject" class="form-control" placeholder="제목을 입력하세요">
		<textarea id="content" class="form-control" placeholder="내용을 입력하세요" rows="10"></textarea>
	
		<div class="d-flex justify-content-end my-3">
			<input type="file" id="file">
		</div>
		
		<div class="d-flex justify-content-between">
			<button type="button" id="postListBtn" class="btn btn-dark">목록</button>
			
			<div>
				<button type="button" id="clearBtn" class="btn btn-secondary">모두 지우기</button>
				<button type="button" id="saveBtn" class="btn btn-info">저장</button>
			</div>
		</div>
	</div>
</div>	

<script>
	$(document).ready(function(){
		// 목록 버튼 클릭 => 목록 화면 클릭 -> 안됨
		$("#postListBtn").on('click', function(){
			location.href = "post/post-list-view";
		});
		
		//모두 지우기 버튼 클릭 -> 됨
		$("#clearBtn").on('click', function(){
			alert = "모두 지우기"; //alert 안뜸
			$("#subject").val("");
			$("#content").val("");
		});
		
		// 글 저장 버튼 -> 됨
		$("#saveBtn").on('click', function(){
			//alert("글 저장");  //alert됨
			let subject = $("#subject").val().trim();
			let content = $("#content").val();
			
			//validation -> 됨
			if(!subject) {
				alert("제목을 입력하세요.");
				return;
			}
			
			if(!content) {
				alert("내용을 입력하세요.");
				return;
			}
			
			// form 태그를 js에서 만든다.
			// 이미지를 업로드할 때에는 반드시 form태그가 있어야한다.
			let formData = new FormData();
			formData.append("subject", subject); // key는 name속성과 같다. Request Parameter명
			formData.append("content", content);
			
			// AJAX
			$.ajax({
				//request
				type:"POST"
				, url: "/post/create"
				, data:formData
				, enctype:"multipart/form-data" // 파일 업로드를 위한 필수 설정
				, processData:false // 파일 업로드를 위한 필수 설정, formData를 보낼 때 false로 설정
				, contentType:false // 파일 업로드를 위한 필수 설정, formData를 보낼 때 false로 설정
					
				//response
				, success:function(data) {
					if (data.code == 200) {
						alert("메모가 저장되었습니다.");
						location.href = "/post/post-list-view"
					} else {
						alert(data.error_message);
					}
				}
				, error: function(request, status, error) {
					alert("글을 저장하는데 실패했습니다.");
				}
			});
		});
	});
	
</script>