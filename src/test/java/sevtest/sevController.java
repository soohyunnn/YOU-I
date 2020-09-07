package sevtest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class sevController {

	@RequestMapping(value="/mainTest.do")
	public String mainTest() throws Exception{
		System.out.println("sevController.java-mainTest()");
		
		return "sample/hello";
	}
	
}
