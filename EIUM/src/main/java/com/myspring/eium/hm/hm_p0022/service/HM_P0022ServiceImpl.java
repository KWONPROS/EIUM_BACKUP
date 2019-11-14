package com.myspring.eium.hm.hm_p0022.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import com.myspring.eium.hm.hm_p0022.dao.HM_P0022DAO;
import com.myspring.eium.hm.hm_p0022.vo.HM_P0022VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0022ServiceImpl implements HM_P0022Service{

	@Autowired
	private HM_P0022DAO hM_P0022DAO;
	
	@Override
	public List<HM_P0022VO> appointList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list =  hM_P0022DAO.appointList(searchMap); 
		return list;
	}
	
	
	@Override
	public List<HM_P0022VO> appointSearch_p01(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list =  hM_P0022DAO.appointSearch_p01(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0022VO> masterEmployee_p02(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list =  hM_P0022DAO.masterEmployee_p02(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0022VO> homeSearch_p03(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list =  hM_P0022DAO.homeSearch_p03(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0022VO> homeEmployeeSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0022VO> list =  hM_P0022DAO.homeEmployeeSearch(searchMap); 
		return list;
	}
	

	@Override
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("Status");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // 현재 Index의 Row Map
			if("I".equals(str)) { // 추가
				hM_P0022DAO.insertData(row);
			}else if("U".equals(str)) { // 수정
				hM_P0022DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				hM_P0022DAO.deleteData(row);
			}
			i++;
		}
	}
	
	@Override
	public void saveData2(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("Status");
		int length = status.length; // row수
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // 현재 Index의 Row Map
			if("I".equals(str)) { // 추가
				hM_P0022DAO.insertData2(row);
			}else if("U".equals(str)) { // 수정
				hM_P0022DAO.updateData2(row);
			}else if("D".equals(str)) { // 삭제
				hM_P0022DAO.deleteData2(row);
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
