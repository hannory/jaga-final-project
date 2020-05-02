package com.kh.jaga.finStmt.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kh.jaga.finStmt.model.vo.IncomeStmt;
import com.kh.jaga.finStmt.model.vo.IncomeStmtAccount;
import com.kh.jaga.finStmt.model.vo.MfrgStmt;

@Repository
public class FinStmtDaoImpl implements FinStmtDao {

	@Override
	public int insertIncomeStmt(SqlSessionTemplate sqlSession, IncomeStmt i) {
		
		return sqlSession.insert("FinStmt.insertIncomeStmt", i);
	}

	@Override
	public ArrayList selectSlip(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {
		
		ArrayList list = (ArrayList) sqlSession.selectList("FinStmt.selectSlip", isa);
		
		return list;
	}

	@Override
	public List selectCurFinStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {

		return sqlSession.selectList("FinStmt.selectCurFinStmt", isa);	
	}

	@Override
	public List selectPastFinStmt(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {

		return sqlSession.selectList("FinStmt.selectPastFinStmt", isa);
	}

	@Override
	public int insertMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms) {

		return sqlSession.insert("FinStmt.insertMfrgStmt", ms);
	}

	@Override
	public int countMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms) {
				
		return sqlSession.selectOne("FinStmt.countMfrgStmt", ms);
	}

	@Override
	public int updateMfrgStmt(SqlSessionTemplate sqlSession, MfrgStmt ms) {
		
		int result = sqlSession.update("FinStmt.updateMfrgStmt", ms);
		
		return result;
	}

	@Override
	public MfrgStmt searchMfrg(SqlSessionTemplate sqlSession, MfrgStmt ms) {
		
		return sqlSession.selectOne("FinStmt.searchMfrg", ms);
	}

	@Override
	public int selectMfrgSum90(SqlSessionTemplate sqlSession, IncomeStmtAccount isa) {

		return sqlSession.selectOne("FinStmt.selectMfrgSum90", isa);
	}

}








