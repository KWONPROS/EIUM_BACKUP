package com.myspring.eium.sm.sm_p0003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0003.dao.P0003DAO;
import com.myspring.eium.sm.sm_p0003.vo.P0003VO;

@Service("P0003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class P0003ServiceImpl implements P0003Service {

	@Autowired
	private P0003DAO p0003DAO;

	@Override
	public List<P0003VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0003VO> list=p0003DAO.searchList(searchMap);

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
				p0003DAO.insertData(row);
			}else if("U".equals(str)) { // 수정
				p0003DAO.updateData(row);
			}else if("D".equals(str)) { // 삭제
				p0003DAO.deleteData(row);
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
	
	
	

	@Override
	public List<P0003VO> searchpopup(Map<String, Object> searchMap) throws DataAccessException {
		List<P0003VO> list=p0003DAO.searchpopup(searchMap);

		return list;
	}
	
	@Override
	public void saveDatapopup(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("Status");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				p0003DAO.insertDatapopup(row);
			}else if("U".equals(str)) { // ����
				p0003DAO.updateDatapopup(row);
			}else if("D".equals(str)) { // ����
				p0003DAO.deleteDatapopup(row);
			}
			i++;
		}
	}
	
	@Override
	public List<P0003VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0003VO> list=p0003DAO.searchSiteList(searchMap);

		return list;
	}
	
	
	
	
}
