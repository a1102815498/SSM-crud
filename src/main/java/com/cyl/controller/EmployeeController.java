package com.cyl.controller;



import static org.hamcrest.CoreMatchers.nullValue;

import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cyl.bean.Employee;
import com.cyl.bean.Msg;
import com.cyl.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {

	@Autowired
	EmployeeService eService;
	
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(String empName) {
		String regName = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
		if (!empName.matches(regName)) {
			return Msg.fail().add("va_msg", "用户名必须是2-5位中文或6-16位英文加字母！");
		}
		
	boolean flag  =	eService.checkUser(empName);
		if (flag) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名不可用");
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("/emps")
	public Msg getEmpWithJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
		PageHelper.startPage(pn, 5); 
		PageHelper.orderBy("emp_id asc");
		List<Employee>emps = eService.getAllemps();
		PageInfo pageInfo = new PageInfo(emps, 5);
		return Msg.success().add("pageinfo", pageInfo);
	}
	
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result){
		if (result.hasErrors()) {
			System.out.println(employee);
			List<FieldError> errors = result.getFieldErrors();
			Map<String, Object> map = new HashMap<String, Object>();
			for (FieldError fieldError : errors) {
				System.out.println(fieldError.getField());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorsField", map);
		}else {
			eService.save_Emp(employee);
			return Msg.success();
		}
		
		
	}
	
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg saveEmp(Employee employee) {
		System.out.println(employee);
		eService.UpateEmp(employee);
		
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping(value = "/emp/{id}",method=RequestMethod.GET)
	public Msg getEmp(@PathVariable Integer id) {
		//System.out.println(id);
	Employee  employee = eService.getEmp(id);
	   return Msg.success().add("emp", employee);
	}
	
	/**
	 * 单个批量二合一
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids") String ids) {
		if(ids.contains("-")) {
			List<Integer> del_ids = new ArrayList<Integer>();
			String[] str_ids = ids.split("-");
			for (String string : str_ids) {
				del_ids.add(Integer.parseInt(string));
			}
			eService.deleteBath(del_ids);
		}else {
			Integer id = Integer.parseInt(ids);
			eService.deleteByid(id);
		}
		
	
		return Msg.success();
	}
	
	/**
	 * 
	 * 
	 * @return
	 */
	/*
	 * @RequestMapping("/emps") public String getEmps(@RequestParam(value = "pn",
	 * defaultValue = "1") Integer pn, Model model) {
	 * 
	 * PageHelper.startPage(pn, 5); PageHelper.orderBy("emp_id asc"); List<Employee>
	 * emps = eService.getAllemps(); PageInfo pageInfo = new PageInfo(emps, 5);
	 * model.addAttribute("pageinfo", pageInfo); return "list"; }
	 */

}
