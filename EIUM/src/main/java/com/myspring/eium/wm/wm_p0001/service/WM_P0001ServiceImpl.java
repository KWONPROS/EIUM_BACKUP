package com.myspring.eium.wm.wm_p0001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.wm.wm_p0001.dao.WM_P0001DAO;
import com.myspring.eium.wm.wm_p0001.vo.WM_P0001VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class WM_P0001ServiceImpl implements WM_P0001Service {
	@Autowired
	private WM_P0001DAO p0001DAO;

	@Override
	public List<WM_P0001VO> EMP_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<WM_P0001VO> list =  p0001DAO.EMP_searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<WM_P0001VO> WS_searchList(Map<String, String> searchMap) throws DataAccessException {
		List<WM_P0001VO> list = p0001DAO.WS_searchList(searchMap);
		return list;
	}	

	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				p0001DAO.insertData(row);
			}else if("U".equals(str)) { // ����
				p0001DAO.updateData(row);
			}else if("D".equals(str)) { // ����
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
