package com.myspring.eium.hm.hm_p0002.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0002.dao.HM_P0002DAO;
import com.myspring.eium.hm.hm_p0002.vo.HM_P0002VO;






@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0002ServiceImpl implements HM_P0002Service {
	@Autowired
	private HM_P0002DAO p0002DAO;

	@Override
	public List<HM_P0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0002VO> list =  p0002DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0002VO> searchSelect(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0002VO> list =  p0002DAO.searchSelect(searchMap); 
		return list;
	}
	
	
	@Override
	public List<HM_P0002VO> searchSiteList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0002VO> list =  p0002DAO.searchSiteList(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0002VO> searchJobclassList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0002VO> list =  p0002DAO.searchJobclassList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap, String u)  throws DataAccessException  {
		String[] status = dataMap.get("Status");
		int length = status.length; 
		int i = 0;

		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, u); 
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
	
	@Override
	public void saveSelect(Map<String, String[]> dataMap, String u, String x)  throws DataAccessException  {
		String[] status = dataMap.get("Status");
		int length = status.length; 
		int i = 0;

		
		for(String str : status) {
			Map<String, String> row = getRow2(dataMap, length, i, u, x); 
			if("I".equals(str)) { 
				p0002DAO.insertData2(row);
			}else if("U".equals(str)) { 
				p0002DAO.updateData2(row);
			}else if("D".equals(str)) { 
				p0002DAO.deleteData2(row);
			}
			i++;
		}
	}

	
	
	
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index, String u) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("user", u);


			}
		}		
		return row;
	}	
	
	private Map<String, String> getRow2(Map<String, String[]> dataMap, int length, int index, String u, String x) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("user", u);
				row.put("x", x);


			}
		}		
		return row;
	}	
}
