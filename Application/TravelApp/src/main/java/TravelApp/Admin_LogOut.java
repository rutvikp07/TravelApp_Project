package TravelApp;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class Admin_LogOut
{
WebDriver driver;
	
	
	@BeforeMethod
	public void setUp() {
		driver = new ChromeDriver();
		driver.get("http://localhost:8080/TravelApp/AdminLogin.html");
		driver.manage().timeouts().implicitlyWait(5,TimeUnit.SECONDS) ;
		driver.manage().window().maximize();
		
	
	}
	
	@Test
	public void LogOut() throws IOException {
		Login_Page Lp = new Login_Page(driver);
		Lp.setUserName("admin");
		Lp.setPassword("admin");
		Lp.clickBtn();
		
		//Switching to nav-frame
		WebElement frame = driver.findElement(By.name("AdminMenuFrame"));
		driver.switchTo().frame(frame);
		driver.findElement(By.xpath("//img[@name='logout']")).click();
		
		
		Lp.takeScreenshot("Admin_LogOut");
	}
	@AfterMethod
	public void down() {
		driver.close();
	}
	
	

}
