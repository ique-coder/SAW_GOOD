package com.saw.good.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {

	private String userId;
	private String password;
	private String userName;
	private String email;
	private String phone;
	private String postCode;
	private String address1;
	private String address2;
	private String profile;
	private int point;
	private boolean status;
	private boolean emailAccess;

}
