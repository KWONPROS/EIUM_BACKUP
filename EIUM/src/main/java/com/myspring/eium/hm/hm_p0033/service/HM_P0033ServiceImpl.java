package com.myspring.eium.hm.hm_p0033.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.hm.hm_p0033.dao.HM_P0033DAO;
import com.myspring.eium.hm.hm_p0033.vo.HM_P0033VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0033ServiceImpl implements HM_P0033Service {
	@Autowired
	private HM_P0033DAO p0033DAO;

	@Override
	public List<HM_P0033VO> searchTypeList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.typeList(searchMap); 
		return list;
	}
	
	
	
	@Override
	public List<HM_P0033VO> paygrade_searchData(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.paygradeList(searchMap); 
		return list;
	}
	@Override
	public List<HM_P0033VO> paydate_searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.paydate_searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0033VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.searchList(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0033VO> searchReceipt(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.searchReceipt(searchMap); 
		return list;
	}
	
	@Override
	public List<HM_P0033VO> BankList(Map<String, Object> searchMap) throws DataAccessException {
		List<HM_P0033VO> list =  p0033DAO.BankList(searchMap); 
		return list;
	}

	@Override
	public void saveData(Map<String, String[]> dataMap, String user,String x, String y)  throws DataAccessException  {
		String[] status = dataMap.get("STATUS");
		int length = status.length; // row��
		int i = 0;
		
		for(String str : status) {
			Map<String, String> row = getRow(dataMap, length, i, user, x, y); // ���� Index�� Row Map
			if("I".equals(str)) { // �߰�
				p0033DAO.insertData(row);
			}else if("U".equals(str)) { // ����
				p0033DAO.updateData(row);
			}else if("D".equals(str)) { // ����
				p0033DAO.deleteData(row);
			}
			i++;
		}
	}
	
	private Map<String, String> getRow(Map<String, String[]> dataMap, int length, int index, String user, String x, String y) {
		Map<String, String> row = new HashMap<String, String>();
		for(String name : dataMap.keySet()) {
			String[] data = dataMap.get(name);
			if(length == data.length) {
				row.put(name, data[index]);
				row.put("user", user);
				row.put("x", x);
				row.put("y", y);


			}
		}		
		return row;
	}

	
}
