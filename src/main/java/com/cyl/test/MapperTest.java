package com.cyl.test;

import static org.hamcrest.CoreMatchers.nullValue;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cyl.bean.Department;
import com.cyl.bean.Employee;
import com.cyl.dao.DepartmentMapper;
import com.cyl.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;

	@Autowired
	EmployeeMapper employeeMapper;

	@Autowired
	SqlSession SqlSession;

	@Test
	public void crudtest() {
		// System.out.println(departmentMapper);
		// departmentMapper.insertSelective(new Department(null,"寮�鍙戦儴"));
		// departmentMapper.insertSelective(new Department(null,"娴嬭瘯閮�"));
		EmployeeMapper mapper = SqlSession.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 100; i++) {
			String uuid = UUID.randomUUID().toString().substring(0, 5) + i;
			mapper.insertSelective(new Employee(null, uuid, "男", uuid + "@QQ.COM", 3));
		}

	}
}
