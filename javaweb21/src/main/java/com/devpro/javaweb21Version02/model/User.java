package com.devpro.javaweb21Version02.model;


import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import net.bytebuddy.implementation.bind.annotation.Empty;

@Entity
@Table(name = "tbl_users")
public class User extends BaseEntity implements UserDetails {

	/*
	 * @NotEmpty(message = "Email không được để trống")
	 * 
	 * @Email(message = "Email không đúng định dạng")
	 */
	@Column(name = "username", length = 45, nullable = false)
	private String username;

	/*
	 * @NotEmpty(message = "Mật khẩu không được để trống")
	 * 
	 * @Size(min = 4,max = 16,message = "Mật khẩu phải từ 4-16 ký tự")
	 */
	@Column(name = "password", length = 100, nullable = false)
	private String password;

	
	@Column(name = "fullname", length = 45, nullable = false)
	private String fullname;

	/*
	 * @NotEmpty(message = "Số điện thoại không được để trống")
	 * 
	 * @Size(min = 10,max = 11,message = "Số điện thoại tối thiểu 10-11 chữ số")
	 */
	@Column(name = "phone", length = 100, nullable = false)
	private String phone;
	
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_users_roles", 
			   joinColumns = @JoinColumn(name = "user_id"), 
			   inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles = new HashSet<Role>();
	
	public void addRoles(Role role) {
		role.getUsers().add(this);
		roles.add(role);
	}
	public void deleteRole(Role role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}
	
	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "user")
	private Set<ProductReview> productReviews = new HashSet<ProductReview>();
	public void addProductReview(ProductReview productReview) {
		productReviews.add(productReview);
		productReview.setUser(this);
	}
	public void deleteProductReview(ProductReview productReview) {
		productReviews.remove(productReview);
		productReview.setUser(null);
	}
	
	public Set<ProductReview> getProductReviews() {
		return productReviews;
	}
	public void setProductReviews(Set<ProductReview> productReviews) {
		this.productReviews = productReviews;
	}

	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "user")
	private Set<SaleOrder> saleOrders = new HashSet<SaleOrder>();
	public void addSaleOrder(SaleOrder saleOrder) {
		saleOrders.add(saleOrder);
		saleOrder.setUser(this);
	}
	public void deleteSaleOrder(SaleOrder saleOrder) {
		saleOrders.remove(saleOrder);
		saleOrder.setUser(null);
	}
	
	
	
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<SaleOrder> getSaleOrders() {
		return saleOrders;
	}

	public void setSaleOrders(Set<SaleOrder> saleOrders) {
		this.saleOrders = saleOrders;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.roles;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}	
	
}
