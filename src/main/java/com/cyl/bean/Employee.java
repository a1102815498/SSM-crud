package com.cyl.bean;

import javax.validation.constraints.Pattern;

public class Employee {
	private Integer empId;
	
	@Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",
			message = "用户名必须是2-5位中文或6-16位英文加字母！")
	private String empName;

	private String gender;
	
	@Pattern(regexp = "^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.[a-zA-Z0-9]{2,6}$",
			message="用户邮箱格式不正确")
	private String emai;

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", gender=" + gender + ", emai=" + emai + ", dId="
				+ dId + ", dept=" + dept + "]";
	}

	private Integer dId;
	private Department dept;

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public Employee() {
		super();
	}

	public Employee(Integer empId, String empName, String gender, String emai, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gender = gender;
		this.emai = emai;
		this.dId = dId;
	}

	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName == null ? null : empName.trim();
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender == null ? null : gender.trim();
	}

	public String getEmai() {
		return emai;
	}

	public void setEmai(String emai) {
		this.emai = emai == null ? null : emai.trim();
	}

	public Integer getdId() {
		return dId;
	}

	public void setdId(Integer dId) {
		this.dId = dId;
	}
}