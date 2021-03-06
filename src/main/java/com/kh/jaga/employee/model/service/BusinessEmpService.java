package com.kh.jaga.employee.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.jaga.employee.model.vo.Attachment;
import com.kh.jaga.employee.model.vo.Bank;
import com.kh.jaga.employee.model.vo.BusinessEmp;
import com.kh.jaga.employee.model.vo.BusinessEmp2;
import com.kh.jaga.employee.model.vo.TypeOfBizCode;

public interface BusinessEmpService {

	List<Bank> selectBankList();

	List<TypeOfBizCode> selectTOBList();

	int insertBEmp(BusinessEmp be);

	List<BusinessEmp> selectBEmpList(String comCode);

	BusinessEmp2 selectOneBEmp(String empCode);

	int updateBEmp(BusinessEmp be, ArrayList<Attachment> attList);

	int deletePhoto(String fileCode);

	Attachment selectFilePath(String fileCode);

}
