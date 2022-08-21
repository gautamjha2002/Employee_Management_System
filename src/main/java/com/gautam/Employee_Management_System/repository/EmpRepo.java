package com.gautam.Employee_Management_System.repository;
import com.gautam.Employee_Management_System.entity.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EmpRepo extends JpaRepository<Employee, Integer> {

}
