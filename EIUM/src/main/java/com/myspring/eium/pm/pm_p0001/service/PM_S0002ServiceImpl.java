package com.myspring.eium.pm.pm_p0001.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.pm.pm_p0001.dao.PM_S0002DAO;
import com.myspring.eium.pm.pm_p0001.vo.PM_S0002VO;




@Service
@Transactional(propagation = Propagation.REQUIRED)
public class PM_S0002ServiceImpl implements PM_S0002Service {
	@Autowired
	private PM_S0002DAO pM_S0002DAO;

	@Override
	public List<PM_S0002VO> searchList(Map<String, Object> searchMap) throws DataAccessException {
		List<PM_S0002VO> list =  pM_S0002DAO.searchList(searchMap); 
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
				pM_S0002DAO.insertData(row);
			}else if("U".equals(str)) { // ����
				pM_S0002DAO.updateData(row);
			}else if("D".equals(str)) { // ����
				pM_S0002DAO.deleteData(row);
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
