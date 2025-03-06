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
                <th>아이디</th>
                <th>이름</th>
                <th>주소</th>
                <th>비밀번호</th>
            </tr>
            <tr v-for="item in list">
                <td>{{item.userId}}</td>
                <td>{{item.userName}}</td>
                <td>{{item.address}}</td>
                <td>{{item.password}}</td>
            </tr>
        </table>
	</div>
</body>
</html>
<script>
    const app = Vue.createApp({
        data() {
            return {
                list : [],
            };
        },
        methods: {
            fnMemberList(){
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
            }
        },
        mounted() {
            var self = this;
            self.fnMemberList();
        }
    });
    app.mount('#app');
</script>