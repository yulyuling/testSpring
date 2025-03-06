<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
	<title>첫번째 페이지</title>
</head>
<style>
</style>
<body>
	<div id="app">
		<div>제목<input v-model="title"> </div>
        <div>내용 <textarea cols="50" rows="20" v-model="contents"></textarea></div>
        <button @click="fnAdd()">저장</button>
    </div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                title : "",
                contents : "",
            };
        },
        methods: {
            fnAdd(){
				var self = this;
				var nparmap = {
                    title : self.title,
                    contents : self.contents
                };
				$.ajax({
					url:"/board/add.dox",
					dataType:"json",	
					type : "POST", 
					data : nparmap,
					success : function(data) { 
						console.log(data);
                        alert("저장됐습니다!");
                        location.href="/board/list.do"
					}
				});
            }
        },
        mounted() {
            var self = this;

        }
    });
    app.mount('#app');
</script>