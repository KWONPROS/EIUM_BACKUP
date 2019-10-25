package com.myspring.eium.sm.sm_p0002.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0002.dao.P0002DAO;
import com.myspring.eium.sm.sm_p0002.vo.P0002VO;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class P0002ServiceImpl implements P0002Service {
	@Autowired
	private P0002DAO p0002DAO;

	@Override
	public List<P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<P0002VO> list =  p0002DAO.searchList(searchMap); 
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
				p0002DAO.insertData(row);
			}else if("U".equals(str)) { 
				p0002DAO.updateData(row);
			}else if("D".equals(str)) { 
				p0002DAO.deleteData(row);
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
