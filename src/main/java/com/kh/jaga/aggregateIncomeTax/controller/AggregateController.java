package com.kh.jaga.aggregateIncomeTax.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.jaga.aggregateIncomeTax.model.dto.AddedTaxStmtDto;
import com.kh.jaga.aggregateIncomeTax.model.service.AggregateService;

/**
 * @author SWY
 * @comment 종합소득세 컨트롤러
 * @createDate 2020. 4. 29.
 */
@Controller
public class AggregateController {
	
	@Autowired
	AggregateService service;
	
	@RequestMapping("showAggregateIncomeTax.aggregate")
	public String showAggregateIncomeTax() {
		/* 소득금액명세서 */
		return "aggregateIncomeTax";
	}

	@RequestMapping("showIncomeDeductStmt.aggregate")
	public String showIncomeDeductStmt() {
		/* 소득공제명세서 */
		
		return "incomeDeductStmt";
	}
	
	@RequestMapping("showAddedTaxStmt.aggregate")
	public String showAddedTaxStmt() {
		/* 가산세명세서 */
		return "addedTaxStmt";
	}
	
	@RequestMapping("showAggregateCalculated.aggregate")
	public String showAggregateCalculated() {
		/* 종합소득세액계산서 */
		return "aggregateCalculated";
	}
	
	@RequestMapping("insertAddedTaxStmt.aggregate")
	public String insertAddedTaxStmt(@ModelAttribute AddedTaxStmtDto dto, Model model) {
		System.out.println("저장 버튼 눌렀음 ,, 컨트롤러도착,, dto :::");
		System.out.println(dto);
		
		int result = service.insertAddedTaxStmt(dto);
		
		model.addAttribute("result", result);;
		
		
		return "addedTaxStmt";
	}
	
	
}//class









