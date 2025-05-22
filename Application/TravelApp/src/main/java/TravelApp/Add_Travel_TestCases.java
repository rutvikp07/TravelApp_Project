package TravelApp;

import static org.junit.Assert.assertFalse;
import static org.testng.Assert.assertTrue;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class Add_Travel_TestCases
{
	WebDriver driver;
	
	
	@BeforeMethod
	public void setUp() {
		driver = new ChromeDriver();
		driver.get("http://localhost:8080/TravelApp/AdminLogin.html");
		driver.manage().timeouts().implicitlyWait(5,TimeUnit.SECONDS) ;
		driver.manage().window().maximize();
		
		//admin login
		
		Login_Page Lp = new Login_Page(driver);
		Lp.setUserName("admin");
		Lp.setPassword("admin");
		Lp.clickBtn();
		
		//Switching to nav-frame
		WebElement frame = driver.findElement(By.name("AdminMenuFrame"));
		driver.switchTo().frame(frame);
		driver.findElement(By.xpath("//img[@name='AddTravel']")).click();
		driver.switchTo().defaultContent();
		WebElement frame1 = driver.findElement(By.name("AdminBodyFrame"));
		driver.switchTo().frame(frame1);
		

	}
	
	@Test(priority = 1)
	public void Valid_add_Travel() throws InterruptedException, IOException {
		
		Add_Travel at= new Add_Travel(driver); 
		at.setValues("YYZ"," Fanshawe ","Rutvik Patel","1234567900");
		at.submit_btn();		
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("Valid_add_Travel");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertTrue(txt.contains("Travels added Successfully"));
		
	}
	
	
	
//	---------------------------------Invalid-------------------------
	@Test(priority = 2)
	public void InValid_add_Travel() throws InterruptedException, IOException {
		
		Add_Travel at= new Add_Travel(driver); 
		String A = "a";
		at.setValues(A.repeat(80)," Fanshawe College, London, ON.",A.repeat(80),"2198704419021378409137241234567890");
		at.submit_btn();		
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("InValid_Add_Travel");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertFalse(txt.contains("Travels added Successfully"));
		
	}
	
	@Test(priority = 3)
	public void Empty_add_Travel() throws InterruptedException, IOException {
		
		Add_Travel at= new Add_Travel(driver); 
		at.setValues(" "," "," "," ");
		at.submit_btn();		
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("Empty_Add_Travel");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertFalse(txt.contains("Travels added Successfully"));
		
	}
	
	@Test(priority = 4)
	public void SpChar_InValid_add_Travel() throws InterruptedException, IOException {
		
		Add_Travel at= new Add_Travel(driver); 
		at.setValues("Fans(&hawe"," Fanshawe College, London, ON.","Rut@vik","123@#$4567890");
		at.submit_btn();		
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("Valid_add_Travel");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertFalse(txt.contains("Travels added Successfully"));
		
	}
	@AfterMethod
	void down() {
		driver.close();
	}
}
