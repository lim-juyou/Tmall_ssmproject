package org.lzzc.pojo;

import lombok.Setter;

public class User {
	@Setter
    private Integer id;

	private String name;

	private String password;

	public Integer getId() {
		return id;
	}

    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getAnonymousName() {
		if (name == null){
			return null;
		}
		if (name.length() <= 1){
			return "*";
		}
		if (name.length() == 2){
			return name.substring(0, 1) + "*";
		}

		char[] cs = name.toCharArray();
		for (int i = 1; i < cs.length - 1; i++) {
			cs[i] = '*';
		}
		return new String(cs);
	}
}