<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<main class="container">
	<form>

		<div class="form-group">
			<label for="title">Title:</label> <input type="text"
				class="form-control" placeholder="title" id="title">
		</div>

		<div class="form-group">
			<label for="content">Content:</label>
			<textarea class="form-control" rows="5" id="content"></textarea>
		</div>

		<button type="button" onclick="saveBoard()" class="btn btn-primary">글쓰기
			등록</button>
	</form>
</main>

<script>
  function saveBoard(){
  	let title = document.querySelector("#title").value;
  	let content = document.querySelector("#content").value;

  	console.log(title);
  	console.log(content);

  	let board = {
    	title: title,
    	content: content
    };

    fetch("/save", {
		method: "post",
		headers:{
			'Content-type' : 'application/json; charset=utf-8'
		},
		body: JSON.stringify(board)
    }).then(res=> res.text()).then(res => {
		if(res=="ok"){
			alert("글쓰기 성공");
			location.href = "/";
		}else{
			alert("글쓰기 실패");
		}
    });
  }


  $(document).ready(function() {
      $('#content').summernote({
    	  tabsize: 2,
          height: 300
      });
  });
</script>

<%@ include file="layout/footer.jsp"%>


