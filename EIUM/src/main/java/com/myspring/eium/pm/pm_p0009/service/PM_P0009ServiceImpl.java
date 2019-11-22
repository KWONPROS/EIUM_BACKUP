package com.myspring.eium.pm.pm_p0009.service;




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
import org.springframework.web.multipart.MultipartFile;

import com.myspring.eium.pm.pm_p0009.dao.PM_P0009DAO;
import com.myspring.eium.pm.pm_p0009.vo.PM_P0009VO;

import oracle.net.aso.p;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PM_P0009ServiceImpl implements PM_P0009Service {
	@Autowired
	private PM_P0009DAO p0009DAO;

	@Override
	public List<PM_P0009VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0009VO> list =  p0009DAO.searchList(searchMap); 
		return list;
	}
	@Override
	public List<PM_P0009VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_P0009VO> list =  p0009DAO.searchList2(searchMap); 
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
				p0009DAO.insertData(row);
			}else if("U".equals(str)) { 
				p0009DAO.updateData(row);
			}else if("D".equals(str)) { 
				p0009DAO.deleteData(row);
			}
			i++;
		}
	}
	@Override
	public void saveFile(Map<String,Object> dataMap)  throws DataAccessException  {
		p0009DAO.saveFile(dataMap);
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
