package com.bit.ms.user.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.ms.dao.UserDaoInterface;
import com.bit.ms.member.model.SeatVO;

@Service
public class UserAddTimeService {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	private UserDaoInterface userDao;
	
	// 로그인한 유저의 남은 시간 
	public long getTime(String userId) {
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.getTime(userId);
	}
	
	// 시간 충전
	public int addTime(long addTime, String userId) {

		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.addTime(addTime, userId);
	}
	
	// 좌석 업데이트 
	public int updateSeat(long time, String userId, String seatId) {

		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		return userDao.updateSeat(time, userId, seatId);
	}
	
	// 현재 모든 좌석 정보 가져오기
	public List<SeatVO> getSeatInfo(){
		userDao = sqlSessionTemplate.getMapper(UserDaoInterface.class);
		
		return userDao.getSeatInfo();
	}
}