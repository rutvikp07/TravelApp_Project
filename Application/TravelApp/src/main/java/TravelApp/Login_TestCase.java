package TravelApp;

import static org.junit.Assert.assertFalse;
import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WrapsDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class Login_TestCase
{
	ChromeDriver driver;
	
	@SuppressWarnings("deprecation")
	@BeforeMethod
	public void setUp() {
	driver = new ChromeDriver();
	driver.get("http://localhost:8080/TravelApp/Login.html");
	driver.manage().timeouts().implicitlyWait(5,TimeUnit.SECONDS) ;
	driver.manage().window().maximize();
	}
	
	@Test(priority = 1)
	public void LogIn() throws IOException {
		Login_Page Lp = new Login_Page(driver);
		Lp.setUserName("capstone");
		Lp.setPassword("info6068");
		Lp.clickBtn();
		Lp.takeScreenshot("LogIn");
		String exp = driver.getTitle();
		assertTrue(exp.contains("User"));
		
	}
	
	@Test(priority = 2)
	public void Reset_button() throws IOException{
		Login_Page Lp = new Login_Page(driver);
		Lp.setUserName("capstone");
		Lp.setPassword("info6068");
		Lp.click_RS_Btn();
		Lp.takeScreenshot("Reset_LogIn");
		String exp = driver.getTitle();
		assertFalse(exp.contains("User"));
		
		
	}
	@Test(priority = 3)
	public void Special_Char() throws IOException{
		Login_Page Lp = new Login_Page(driver);
		Lp.setUserName("c@pst*ne");
		Lp.setPassword("inf*6*68");
		Lp.clickBtn();
		String exp = driver.getTitle();
		assertFalse(exp.contains("User"));	
		Lp.takeScreenshot("special_charac_LogIn");
	}
	
	@Test(priority = 4)
	public void Inv_max() throws IOException{
		Login_Page Lp = new Login_Page(driver);
		Lp.setUserName("capstone4567890123456");
		Lp.setPassword("info606834567890123456");
		Lp.clickBtn();
		
		Lp.takeScreenshot("Inv_max_LogIn");
		String exp = driver.getTitle();
		assertFalse(exp.contains("User"));
		
	}
	
	@Test(priority = 5)
	public void Empty() throws IOException{
		Login_Page Lp = new Login_Page(driver);
		Lp.setUserName(" ");
		Lp.setPassword(" ");
		Lp.clickBtn();
		Lp.takeScreenshot("empty_LogIn");
		String exp = driver.getTitle();
		assertFalse(exp.contains("User"));
		
	}
	
	
	@AfterMethod
	public void down() throws InterruptedException {
		Thread.sleep(4000);
		driver.quit();
	}
	
}

