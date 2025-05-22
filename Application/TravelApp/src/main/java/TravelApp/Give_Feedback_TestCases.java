package TravelApp;

import static org.junit.Assert.assertFalse;
import static org.testng.Assert.assertEquals;
import static org.testng.Assert.assertTrue;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WrapsDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.AfterClass;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeClass;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

public class Give_Feedback_TestCases
{
	private static final Login_Page Lp = null;
	ChromeDriver driver;
	
	@SuppressWarnings("deprecation")
	@BeforeMethod
	public void setUp() {
	driver = new ChromeDriver();
	driver.get("http://localhost:8080/TravelApp/Login.html");
	driver.manage().timeouts().implicitlyWait(5,TimeUnit.SECONDS) ;
	driver.manage().window().maximize();
	
	//LogIn
	Login_Page Lp = new Login_Page(driver);
	Lp.setUserName("capstone");
	Lp.setPassword("info6068");
	Lp.clickBtn();
	
	//clicking on btn and finding frame
	WebElement frame = driver.findElement(By.xpath("//frame[@src='UserOptions.html']"));
	driver.switchTo().frame(frame);
	driver.findElement(By.xpath("//button[normalize-space()='Give Feedback']")).click();
	
	driver.switchTo().defaultContent();
	
	WebElement Result_frame = driver.findElement(By.xpath("//frame[@Name='tgt']"));
	driver.switchTo().frame(Result_frame);
	}
	
	
	
	
	@Test(priority = 1)
	public void GiveFeedback() throws InterruptedException, IOException {
		
		Give_Feedback fb = new Give_Feedback(driver); 
		
		fb.setEmail("TeamPixel@gmail.com ");
		fb.setMessage("Hello World!");
		fb.clickBtn();
		
		fb.takeScreenshot("GiveFeedback_GF");
		String txt = driver.findElement(By.className("SC")).getText();
		assertTrue(txt.contains("Your Feedback submitted successfully!"));
		
		Thread.sleep(1500);
	}
	
	@Test(priority = 2)
	public void Max_Feedback() throws InterruptedException, IOException {
		
		Give_Feedback fb = new Give_Feedback(driver); 
		fb.setEmail("pQrStUvWxYzAbCdEfGhIjKlMnOpQrStUvWxYzAbCdEfGhIjKlMnOpQrStUvWxYzAbCdEfGhIjKlMnOp@gmail.com  ");
		fb.setMessage("Hello World!");
		fb.clickBtn();
		
		fb.takeScreenshot("Max_Feedback_GF");
		String txt = driver.findElement(By.className("SC")).getText();
		assertTrue(txt.contains("Your Feedback submitted successfully!"));
		
		Thread.sleep(1500);
	}
	
	@Test(priority = 3)
	public void clear_Feedback() throws InterruptedException, IOException {
		
		Give_Feedback fb = new Give_Feedback(driver); 
		fb.setEmail("pQrStUvWxYzAbCdEfGhIjKlMnOpQrStUvWxYzAbCdEfGhIjKlMnOpQrStUvWxYzAbCdEfGhIjKlMnOp@gmail.com  ");
		fb.setMessage("Hello World!");
		Thread.sleep(2000);
		fb.click_RS_Btn();
		
		fb.takeScreenshot("clear_Feedback_GF");
		String txt = driver.findElement(By.name("From")).getText();
		String txt1 = driver.findElement(By.name("message")).getText();
		
		assertTrue(txt.isEmpty());
		assertTrue(txt1.isEmpty());
		
		Thread.sleep(1500);
	}
	
	
//	------------------------------------------ Invalid
	
	
	
	@Test(priority = 4)
	public void Inv_SpecialChar() throws InterruptedException, IOException {
		
		Give_Feedback fb = new Give_Feedback(driver); 
		fb.setEmail("p@*#thpa^tel@gmail.com  ");
		fb.setMessage("One^of%the#best!experience");
		fb.clickBtn();
		
		fb.takeScreenshot("Inv_SpecialChar_GF");
		
		WebElement Result_frame = driver.findElement(By.xpath("//frame[@Name='tgt']"));
		driver.switchTo().frame(Result_frame);
		
		String txt = driver.findElement(By.tagName("body")).getText();
		assertTrue(txt.contains("HTTP Status 400 – Bad Request"));
		
		Thread.sleep(1500);
	}
	
	@Test(priority = 5)
	public void Inv_Empty_Feedback() throws InterruptedException, IOException {
		
		Give_Feedback fb = new Give_Feedback(driver); 
		fb.setEmail(" ");
		fb.setMessage(" ");
		fb.clickBtn();
		
		fb.takeScreenshot("Inv_Empty_Feedback_GF");
		
		String txt = driver.findElement(By.className("SC")).getText();
		assertTrue(txt.contains("Your Feedback submitted successfully!"));
		
		Thread.sleep(1500);
	}
	
	@Test(priority = 6)
	public void Inv_TooShort() throws InterruptedException, IOException {
		
		Give_Feedback fb = new Give_Feedback(driver); 
		fb.setEmail("a@b.c");
		fb.setMessage("G");
		fb.clickBtn();
		
		Lp.takeScreenshot("Inv_TooShort_GF");
		
		String txt = driver.findElement(By.className("SC")).getText();
		assertTrue(txt.contains("Your Feedback submitted successfully!"));
		
		Thread.sleep(1500);
	}
	
	@Test(priority = 7)
	public void Inv_TooLong() throws InterruptedException, IOException {
		
		Give_Feedback fb = new Give_Feedback(driver); 
		String str ="D";
		fb.setEmail(str.repeat(249)+"@gmail.com");
		fb.setMessage(str.repeat(1001));
		fb.clickBtn();
		
		fb.takeScreenshot("Inv_TooLong_GF");
		
		String txt = driver.findElement(By.className("SC")).getText();
		assertTrue(txt.contains("com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column 'UserID' at row 1"));
		
		Thread.sleep(1500);
	}
	
	@Test(priority = 8)
	public void Inv_Format() throws InterruptedException, IOException {
		
		Give_Feedback fb = new Give_Feedback(driver); 
		
		fb.setEmail("team");
		fb.setMessage("@gmail.com");
		fb.clickBtn();
		
		fb.takeScreenshot("Inv_Format_GF");
		
		String txt = driver.findElement(By.className("SC")).getText();
		assertTrue(txt.contains("Your Feedback submitted successfully!"));
		
		Thread.sleep(1500);
	}
	
	
	@AfterMethod
	public void down() {
		driver.quit();
	}
	
}

