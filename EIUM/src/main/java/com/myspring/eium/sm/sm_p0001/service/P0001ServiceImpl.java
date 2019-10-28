package com.myspring.eium.sm.sm_p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0001.dao.P0001DAO;
import com.myspring.eium.sm.sm_p0001.vo.P0001VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class P0001ServiceImpl implements P0001Service {
	
	@Autowired
	private P0001DAO p0001DAO;

	@Override
	public List<P0001VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0001VO> list =  p0001DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		System.out.println("status :"+ status);
		int length = status.length; // row수
		System.out.println("P0001ServiceImpl-length:"+length);
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // 현재 Index의 Row Map
			if("I".equals(str)) { // 추가
				p0001DAO.insertData(row);
			}else if("U".equals(str)) { // 수정
				p0001DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				p0001DAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
			}
		}		
		return row;
	}	
}
