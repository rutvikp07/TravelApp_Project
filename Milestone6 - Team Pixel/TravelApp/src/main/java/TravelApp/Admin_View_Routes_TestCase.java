package TravelApp;


import static org.testng.Assert.assertTrue;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class Admin_View_Routes_TestCase
{
ChromeDriver driver;
	
	
	@SuppressWarnings("deprecation")
	@BeforeMethod
	public void setUp() {
	driver = new ChromeDriver();
	driver.get("http://localhost:8080/TravelApp/AdminLogin.html");
	driver.manage().timeouts().implicitlyWait(5,TimeUnit.SECONDS) ;
	driver.manage().window().maximize();
	

	Login_Page Lp = new Login_Page(driver);
	Lp.setUserName("admin");
	Lp.setPassword("admin");
	Lp.clickBtn();
	}
	
	
	
	@Test(priority = 1)
	public void View_Routes_btn() throws InterruptedException, IOException {
		
	WebElement frame = driver.findElement(By.xpath("//frame[@Name='AdminMenuFrame']"));
	driver.switchTo().frame(frame);
	driver.findElement(By.xpath("/html[1]/body[1]/table[1]/tbody[1]/tr[1]/td[2]/a[1]/img[1]")).click();
	
	driver.switchTo().defaultContent();
	
	WebElement frame2 = driver.findElement(By.xpath("//frame[@Name='AdminBodyFrame']"));
	driver.switchTo().frame(frame2);

	String txt = driver.findElement(By.tagName("body")).getText();
	assertTrue(txt.contains("View Routes"));
	Thread.sleep(2000);
	
	Login_Page Lp = new Login_Page(driver);
	Lp.takeScreenshot("View_Routes_btn");
	
	}
	
	
	@AfterMethod
	public void down() {
		driver.quit();
	}
	
	
	
	
}
