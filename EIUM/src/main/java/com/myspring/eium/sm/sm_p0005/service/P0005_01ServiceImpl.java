package com.myspring.eium.sm.sm_p0005.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0005.dao.P0005_01DAO;
import com.myspring.eium.sm.sm_p0005.vo.P0005_01VO;



@Service("smService")
@Transactional(propagation = Propagation.REQUIRED)
public class P0005_01ServiceImpl implements P0005_01Service {
	@Autowired
	private P0005_01DAO p0005_01DAO;

//	@Override
//	public List listMembers() throws DataAccessException {
//		List p0005_01List = null;
//		p0005_01List = p0005_01DAO.selectAllp0005_01List();
//		return p0005_01List;
//	}

	
	@Override
	public List<P0005_01VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0005_01VO> list =  p0005_01DAO.searchList(searchMap); 
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

			
			p0005_01DAO.updateData(row);
				
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
