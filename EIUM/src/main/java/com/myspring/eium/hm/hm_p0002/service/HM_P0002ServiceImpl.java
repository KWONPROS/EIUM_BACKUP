package com.myspring.eium.hm.hm_p0002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.eium.sm.sm_p0003.dao.SM_P0003DAO;
import com.myspring.eium.sm.sm_p0003.vo.SM_P0003VO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class HM_P0002ServiceImpl implements HM_P0002Service {


	
	
}
