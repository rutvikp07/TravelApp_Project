
package TravelApp;

import java.io.File;
import java.io.IOException;

import org.openqa.selenium.By;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.google.common.io.Files;

public class Give_Feedback
{
	WebDriver driver;
		
	//constructor 
	 Give_Feedback(WebDriver driver){
		 this.driver = driver;
	 }
	 
	 By email = By.name("From");
	 By msg = By.name("message");
	 By btn = By.name("Command");
	 By reset_btn = By.name("Clear");
	 
	public void setEmail(String email_id){
		driver.findElement(email).sendKeys(email_id);
	}
	
	public void setMessage(String Message){
		driver.findElement(msg).sendKeys(Message);
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

