package com.myspring.eium.hm.hm_p0004.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0004.dao.HM_P0004DAO;
import com.myspring.eium.hm.hm_p0004.vo.HM_P0004VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0004ServiceImpl implements HM_P0004Service {
	@Autowired
	private HM_P0004DAO p0004DAO;

	@Override
	public List<HM_P0004VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0004VO> list =  p0004DAO.searchList(searchMap); 
		return list;
	}
	

	@Override
	public void saveData(Map<String, String[]> dataMap,String table_NAME)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; 
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i); 
			if("I".equals(str)) { 
				p0004DAO.insertData(row,table_NAME);
			}else if("U".equals(str)) { 
				p0004DAO.updateData(row,table_NAME);
			}else if("D".equals(str)) { 
				p0004DAO.deleteData(row,table_NAME);
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
