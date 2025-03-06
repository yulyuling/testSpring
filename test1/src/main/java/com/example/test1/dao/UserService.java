package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	
	// 사용자 로그인
	HashMap<String, Object> userLogin(HashMap<String, Object> map);
	
}
