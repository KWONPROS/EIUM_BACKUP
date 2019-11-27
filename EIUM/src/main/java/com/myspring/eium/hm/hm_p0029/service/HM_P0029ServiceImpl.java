package com.myspring.eium.hm.hm_p0029.service;



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

import com.myspring.eium.hm.hm_p0029.dao.HM_P0029DAO;
import com.myspring.eium.hm.hm_p0029.vo.HM_P0029VO;

import oracle.net.aso.p;



@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0029ServiceImpl implements HM_P0029Service {
	@Autowired
	private HM_P0029DAO p0029DAO;

	@Override
	public List<HM_P0029VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list =  p0029DAO.searchList(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0029VO> searchList2(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0029VO> list =  p0029DAO.searchList2(searchMap); 
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
				p0029DAO.insertData(row);
			}else if("U".equals(str)) { 
				p0029DAO.updateData(row);
			}else if("D".equals(str)) { 
				p0029DAO.deleteData(row);
			}
			i++;
		}
	}
	@Override
	public void saveFile(Map<String,Object> dataMap)  throws DataAccessException  {
		p0029DAO.saveFile(dataMap);
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
