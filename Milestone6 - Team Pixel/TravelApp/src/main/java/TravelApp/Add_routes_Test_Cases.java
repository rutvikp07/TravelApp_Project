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

public class Add_routes_Test_Cases
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
		driver.findElement(By.xpath("//img[@name='AddRoute']")).click();
		driver.switchTo().defaultContent();
		WebElement frame1 = driver.findElement(By.name("AdminBodyFrame"));
		driver.switchTo().frame(frame1);
		

	}
	
	@Test(priority = 1)
	public void Min_valid_add_routes() throws InterruptedException, IOException {
		
		Add_Routes ar= new Add_Routes(driver); 
		ar.setValues("R","P","2","b","12:30","1:40","1","09/13/2024");
		ar.submit_btn();		
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("Min_valid_add_routes");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertTrue(txt.contains("Route added Successfully"));
		
	}
	
	@Test(priority = 2)
	public void valid_add_routes() throws InterruptedException, IOException {
		
		Add_Routes ar= new Add_Routes(driver); 
		ar.setValues("R","P","2","b","12:30","1:40","1","09/13/2024");
		ar.submit_btn();	
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("valid_add_routes");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertTrue(txt.contains("Route added Successfully"));

	}
	
	@Test(priority = 3)
	public void Max_valid_add_routes() throws InterruptedException, IOException {
		
		Add_Routes ar= new Add_Routes(driver); 
		ar.setValues("qWzXtVbNjRuYsEoFkIlPmAgHdScTyUkMvQwLeOpJxBn",
				"qWzXtVbNjRuYsEoFkIlPmAgHdScTyUkMvQwLeOpJxBn",
				"aB7dEfG2hJkLmN9oPqRs",
				"aB7dEfG2hJkLmN9oPqRs","12:30","1:40",
				"48173692","09/13/2024");
		ar.submit_btn();
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("Max_valid_add_routes");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertTrue(txt.contains("Route added Successfully"));
	}
	
	@Test(priority = 4)
	public void valid_add_routes_Clr() throws InterruptedException, IOException {
		
		Add_Routes ar= new Add_Routes(driver); 
		ar.setValues("R","P","2","b","12:30","1:40","1","09/13/2024");
		ar.clear_btn();
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("valid_add_routes_Clr");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertTrue(txt.contains("Add New Route"));

	}
	
	
	
	
	//----------------------INVALID--------------------------------  
	
	@Test(priority = 5)
	public void max_Invalid_add_route() throws InterruptedException, IOException {
		
		Add_Routes ar= new Add_Routes(driver); 
		String str = "A";
		ar.setValues(str.repeat(51),
				str.repeat(51),
				"Travel12345678901234567",
				"Bus12345678901234567","12:30","1:40",
				"12345678901","09/13/2024");
		ar.submit_btn();
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("max_Invalid_add_route");
		
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertFalse(txt.contains("Route added Successfully"));
	}
	
	
	@Test(priority = 6)
	public void empty_Invalid_add_route() throws InterruptedException, IOException {
		
		Add_Routes ar= new Add_Routes(driver); 
		
		ar.setValues(" ",
				" ",
				" ",
				" "," "," ",
				" "," ");
		ar.submit_btn();
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("empty_Invalid_add_route");
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertFalse(txt.contains("Route added Successfully"));
	}
	
	
	@Test(priority = 7)
	public void format_Invalid_add_route() throws InterruptedException, IOException {
		
		Add_Routes ar= new Add_Routes(driver); 
		
		ar.setValues("Travel123",
				"Location456",
				"Address789",
				"Agent012","123abc456 "," 123abc456",
				"123abc456 ","123abc456 ");
		ar.submit_btn();
		
		Login_Page Lp = new Login_Page(driver);
		Lp.takeScreenshot("format_Invalid_add_route");
		
		
		Thread.sleep(2000);
		String txt = driver.findElement(By.tagName("body")).getText();
		assertFalse(txt.contains("Route added Successfully"));
	}
	
	
	@AfterMethod
	void down() {
		driver.close();
	}
}
