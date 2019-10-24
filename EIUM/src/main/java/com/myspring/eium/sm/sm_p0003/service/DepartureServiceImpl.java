package com.myspring.eium.sm.sm_p0003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0003.dao.DepartureDAO;
import com.myspring.eium.sm.sm_p0003.vo.DepartureVO;

@Service("departureService")
@Transactional(propagation = Propagation.REQUIRED)
public class DepartureServiceImpl implements DepartureService {

	@Autowired
	private DepartureDAO departureDAO;

	@Override
	public List<DepartureVO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<DepartureVO> list=departureDAO.searchList(searchMap);

		return list;
	}



	@Override
	public void saveData(Map<String, String[]> dataMap) throws DataAccessException {
		String[] status = dataMap.get("Status");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				departureDAO.insertData(row);
			}else if("U".equals(str)) { // ����
				departureDAO.updateData(row);
			}else if("D".equals(str)) { // ����
				departureDAO.deleteData(row);
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
	public List<DepartureVO> searchpopup(Map<String, Object> searchMap) throws DataAccessException {
		List<DepartureVO> list=departureDAO.searchpopup(searchMap);

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
				departureDAO.insertDatapopup(row);
			}else if("U".equals(str)) { // ����
				departureDAO.updateDatapopup(row);
			}else if("D".equals(str)) { // ����
				departureDAO.deleteDatapopup(row);
			}
			i++;
		}
	}
	
	@Override
	public List<DepartureVO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<DepartureVO> list=departureDAO.searchSiteList(searchMap);

		return list;
	}
	
	
	
	
}
