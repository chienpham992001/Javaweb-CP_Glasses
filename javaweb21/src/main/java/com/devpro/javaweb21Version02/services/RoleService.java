package com.devpro.javaweb21Version02.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.devpro.javaweb21Version02.model.Role;
import com.devpro.javaweb21Version02.model.User;

@Service
public class RoleService extends BaseService<Role>{

	@Override
	protected Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}
	
	public void updateRole(User user,Role role) {
		if(role.getId()==17) {
			Role adminRole =  this.getById(16);
			Set<Role> userRoles = user.getRoles();
			List<Role> userRoleList = new ArrayList<>(userRoles);
			for (Role role2 : userRoleList) {
				user.deleteRole(role2);
			}
			user.addRoles(adminRole);
		}
		if(role.getId()==16) {
			
		}
	}
}
