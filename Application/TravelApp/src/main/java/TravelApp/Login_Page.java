
package TravelApp;

import java.io.File;
import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import com.google.common.io.Files;

import java.io.IOException;

public class Login_Page
{
	WebDriver driver;
		
	//constructor 
	 Login_Page(WebDriver driver){
		 this.driver = driver;
	 }
	 
	 By username = By.name("Name");
	 By Password = By.name("Pwd");
	 By btn = By.xpath("/html/body/form/table/tbody/tr[3]/td[1]/input");
	 By reset_btn = By.xpath("	/html/body/form/table/tbody/tr[3]/td[2]/input");
	 
	public void setUserName(String user){
		driver.findElement(username).sendKeys(user);
	}
	
	public void setPassword(String pass){
		driver.findElement(Password).sendKeys(pass);
	}
	
	public void click_RS_Btn(){
		driver.findElement(reset_btn).click();
	}

	public void clickBtn(){
		driver.findElement(btn).click();
	}
	
	
	 public void takeScreenshot(String fileName) throws IOException {
   	
   	try {
   	File f=((TakesScreenshot)driver).getScreenshotAs(OutputType.FILE);
 		Files.copy(f,new File("D:\\java clg\\TravelApp\\Screenshots", fileName+".png"));
   	}
   	catch (IOException e) {
   		e.printStackTrace();
   	}
   }
}

