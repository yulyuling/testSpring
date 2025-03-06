package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {

	List<Board> getBoard(HashMap<String, Object> map);

	void insertBoard(HashMap<String, Object> map);

	void deleteBoard(HashMap<String, Object> map);

	
	
}
