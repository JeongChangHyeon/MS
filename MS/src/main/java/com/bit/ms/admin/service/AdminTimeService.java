package com.bit.ms.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.AdminDaoInterface;
import com.bit.ms.user.model.UserVO;

@Service
public class AdminTimeService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private AdminDaoInterface userDao;
		
	// 선택한 좌석의 유저 시간 업데이트( 충전시간, 좌석 번호, 유저 아이디)
	public int updateAddTime(long addTime, int seatId) {
		userDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		return userDao.updateAddTime(addTime, seatId);
	}
	
	// 사용 중인 모든 좌석의 유저 시간 업데이트(사용시간, 충전시간)
	public int updateSaveTimeAll(long useTime) {
		userDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		return userDao.updateSaveTimeAll(useTime);
	}	
	
	// 현재 좌석 사용 중인 사용자 정보 모두 가져오기
	public List<UserVO> getUserInfoAll(){
		userDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		return userDao.getUserInfoAll();
	}
	
	// 사용 종료된 좌석 지우기
	public int deleteSeat(int seatId) {
		userDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		return userDao.deleteSeat(seatId);
	}
	
	// 로그인한 유저의 좌석 사용 상태 검사
	/*public UserVO isUsingSeat(String userId) {
		userDao = sqlSessionTemplate.getMapper(AdminDaoInterface.class);
		return userDao.isUsingSeat(userId);
	}*/
}