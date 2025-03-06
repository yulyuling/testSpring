<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
    table, tr, td, th {
        border: 1px solid black;
        border-collapse: collapse;
    }
</style>
<body>
	<div id="app">
		<table>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>내용</th>
                <th>아이디</th>
                <th>조회수</th>
                <th>날짜</th>
                <th>삭제</th>
            </tr>
            <tr v-for="item in list">
                <td>{{item.boardNo}}</td>
                <td>{{item.title}}</td>
                <td>{{item.contents}}</td>
                <td>{{item.userId}}</td>
                <td>{{item.cnt}}</td>
                <td>{{item.uDateTime}}</td>
                <td><button @click="fnRemove(item.boardNo)">삭제</button></td>
            </tr>
        </table>
        <div>
            <button @click="fnAdd()">글쓰기</button>
        </div>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                list : [],
                title : "",
                contents : "",
            };
        },
        methods: {
            fnBoardList(){
				var self = this;
				var nparmap = {};
				$.ajax({
					url:"list.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data.list);
                        self.list = data.list;

					}
				});
            },
            fnAdd(){
                location.href="/board/add.do";
            },
            fnRemove : function(boardNo){
                var self = this;
				var nparmap = {
                    boardNo : boardNo
                };
				$.ajax({
					url:"/board/remove.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) {
                
						console.log(boardNo);
                        alert("삭제됐습니다!");
                        location.href="/board/list.do"
					}
				});
            }
        },
        mounted() {
            var self = this;
            self.fnBoardList();
        }
    });
    app.mount('#app');
</script>