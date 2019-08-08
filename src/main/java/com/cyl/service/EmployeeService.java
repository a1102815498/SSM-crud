package com.cyl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyl.bean.Employee;
import com.cyl.bean.EmployeeExample;
import com.cyl.bean.EmployeeExample.Criteria;
import com.cyl.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	private Employee selectByPrimaryKey;

	public List<Employee> getAllemps() {

		return employeeMapper.selectByExampleWithDept(null);
	}

	public void save_Emp(Employee employee) {
		employeeMapper.insert(employee);
		
	}

	public boolean checkUser(String empName) {
		
		EmployeeExample example = new EmployeeExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

	public Employee getEmp(Integer id) {
		
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		//System.out.println(employee);
		return employee;
	}

	public void UpateEmp(Employee employee) {
	employeeMapper.updateByPrimaryKeySelective(employee);
		
	}

	public void deleteByid(Integer id) {
		employeeMapper.deleteByPrimaryKey(id);
		
	}

	public void deleteBath(List<Integer> del_ids) {
		EmployeeExample example = new EmployeeExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andEmpIdIn(del_ids);
		employeeMapper.deleteByExample(example);
		
	}

}
