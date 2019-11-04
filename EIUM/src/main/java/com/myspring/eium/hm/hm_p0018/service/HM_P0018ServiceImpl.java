package com.myspring.eium.hm.hm_p0018.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0018.dao.HM_P0018DAO;
import com.myspring.eium.hm.hm_p0018.vo.HM_P0018VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0018ServiceImpl implements HM_P0018Service {
	
	@Autowired
	private HM_P0018DAO hM_P0018DAO;

	@Override
	public List<HM_P0018VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0018VO> list =  hM_P0018DAO.searchList(searchMap); 
		return list;
	}

	
	@Override
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // 현재 Index의 Row Map
			if("I".equals(str)) { // 추가
				hM_P0018DAO.insertData(row);
			}else if("U".equals(str)) { // 수정
				hM_P0018DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				hM_P0018DAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map getRow(Map<String, String[]> dataMap, int length, int index) {
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