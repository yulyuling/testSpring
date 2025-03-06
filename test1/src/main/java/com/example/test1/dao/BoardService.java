package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;

@Service
public class BoardService {
	
	//get, select
	//add, insert
	//edit, update
	//remove, delete
	//헷갈리니까 이렇게 나눠서 구분함.
	
	@Autowired
	BoardMapper boardMapper;

	public HashMap<String, Object> boardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =  new HashMap<String, Object>();
		List<Board> list = boardMapper.getBoard(map);
		resultMap.put("list",list);
		return resultMap;
	}


	public HashMap<String, Object> boardAdd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =  new HashMap<String, Object>();
		boardMapper.insertBoard(map);
		resultMap.put("result", "success");
		
		return resultMap;
	}


	public HashMap<String, Object> boardRemove(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap =  new HashMap<String, Object>();
		boardMapper.deleteBoard(map);
		resultMap.put("result", "success");
		
		return resultMap;
	}



}
