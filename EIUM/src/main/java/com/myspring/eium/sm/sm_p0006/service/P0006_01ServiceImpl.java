package com.myspring.eium.sm.sm_p0006.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0006.dao.P0006_01DAO;
import com.myspring.eium.sm.sm_p0006.vo.P0006_01VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class P0006_01ServiceImpl implements P0006_01Service {
	@Autowired
	private P0006_01DAO p0006_01DAO;

//	@Override
//	public List listMembers() throws DataAccessException {
//		List p0006_01List = null;
//		p0006_01List = p0006_01DAO.selectAllp0006_01List();
//		return p0006_01List;
//	}

	
	@Override
	public List<P0006_01VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0006_01VO> list =  p0006_01DAO.searchList(searchMap); 
		return list;
	}
	

	@Override
	public void saveData(Map<String, String[]> dataMap, String x) throws DataAccessException {
		
		String[] status = dataMap.get("sStatus");
		int length = status.length; // row��
		int i = 0;
		
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, x); // ���� Index�� Row Map
			if("U".equals(str)) { // ����
			p0006_01DAO.updateData(row);		
				for(String key : row.keySet()){ 	 
		            String value = row.get(key);
		        }
			}
			i++;
		}
	}

	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int i, String x) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[i]);
				row.put("x", x);
			}
		}		
		return row;
	}


}
