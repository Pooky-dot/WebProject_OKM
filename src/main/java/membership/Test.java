package membership;
class A {
	int num1; 	
	//기본생성자
	public A() {}
	//인수생성자
	public A(int num1) {
		this.num1 = num1;
	}
	/* 만약 개발자가 직접 생성자를 정의하지 않으면 기본생성자가
	자동으로 코드에 삽입된다.
	생성자를 직접 정의한다면 기본생성자는 추가되지 않는다.  
	즉, 클래스를 통해 인스턴스를 만들때는 반드시 생성자를 통해서만 
	생성할 수 있다. */
}
public class Test {
	public static void main(String[] args) {
		A a1 = new A();
		A a2 = new A(10);
	}
}
