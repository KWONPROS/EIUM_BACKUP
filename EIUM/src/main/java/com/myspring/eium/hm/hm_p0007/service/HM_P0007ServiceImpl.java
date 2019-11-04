package com.myspring.eium.hm.hm_p0007.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0007.dao.HM_P0007DAO;
import com.myspring.eium.hm.hm_p0007.vo.HM_P0007VO;






@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0007ServiceImpl implements HM_P0007Service {
	@Autowired
	private HM_P0007DAO p0007DAO;

	@Override
	public List<HM_P0007VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0007VO> list =  p0007DAO.searchList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; 
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); 
			if("I".equals(str)) { 
				p0007DAO.insertData(row);
			}else if("U".equals(str)) { 
				p0007DAO.updateData(row);
			}else if("D".equals(str)) { 
				p0007DAO.deleteData(row);
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