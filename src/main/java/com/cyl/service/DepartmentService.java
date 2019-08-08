package com.cyl.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cyl.bean.Department;
import com.cyl.dao.DepartmentMapper;

@Service
public class DepartmentService {
	
	@Autowired
	DepartmentMapper departmentMapper;
	public List<Department> getDepts() {
		List<Department> depts = departmentMapper.selectByExample(null);
		return depts;
	}
}
