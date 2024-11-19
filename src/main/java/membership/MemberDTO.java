package membership;

import java.sql.Date;

/*
DTO(Data Transfer Object)
: JSP와 Java파일간에 데이터를 전달하기 위한 객체로 자바빈 규약에 의해
제작한다. 

자바빈즈 규약
1.자바빈즈는 기본(default) 패키지 이외의 패키지에 속해야한다. 
2.멤버변수(속성)의 접근지정자는 private으로 선언한다. 
3.기본 생성자가 있어야 한다. 
4.멤버변수에 접근할 수 있는 getter/setter가 있어야한다. 
5.getter/setter는 public 접근지정자를 가져야한다. 
*/
public class MemberDTO {
	//멤버변수 : member 테이블의 컬럼과 동일하게 생성 
    
    private String username;
    private String password;
    private String name;
    private String email;
    private String phone;
    private Date created_at;
    private Date updated_at;
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
    
	
    /*
    생성자의 경우 꼭 필요한 경우가 아니라면 생성하지 않는다. 
    생성자를 직접 정의하지 않으면 컴파일러에 의해 디폴트(기본) 생성자가
    자동으로 추가되기 때문이다. 
     */
    
    /*
    정보은닉된 멤버변수에 접근하기 위해 public으로 정의된 
    getter/setter 메서드를 정의한다. 
     */
	


 
}