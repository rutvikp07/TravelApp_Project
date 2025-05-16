package TravelApp;

import static org.testng.Assert.assertTrue;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.AfterMethod;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

public class View_Routes_Feedback
{
ChromeDriver driver;
	
	@SuppressWarnings("deprecation")
	@BeforeMethod
	public void setUp() {
	driver = new ChromeDriver();
	driver.get("http://localhost:8080/TravelApp/Login.html");
	driver.manage().timeouts().implicitlyWait(5,TimeUnit.SECONDS) ;
	driver.manage().window().maximize();
	

	Login_Page Lp = new Login_Page(driver);
	Lp.setUserName("capstone");
	Lp.setPassword("info6068");
	Lp.clickBtn();
	}
	
	
	
	@Test(priority = 1)
	public void View_Routes_btn() throws InterruptedException {
		
	WebElement frame = driver.findElement(By.xpath("//frame[@src='UserOptions.html']"));
	driver.switchTo().frame(frame);
	driver.findElement(By.xpath("//button[normalize-space()='View Routes']")).click();
	
	driver.switchTo().defaultContent();
	
	WebElement Result_frame = driver.findElement(By.xpath("//frame[@Name='tgt']"));
	driver.switchTo().frame(Result_frame);
	
	String txt = driver.findElement(By.className("SC")).getText();
	assertTrue(txt.contains("View Routes"));
	
	Thread.sleep(1500);
	}
	
	@Test(priority = 2)
	public void View_Feedback_btn() throws InterruptedException {
		
	WebElement frame = driver.findElement(By.xpath("//frame[@src='UserOptions.html']"));
	driver.switchTo().frame(frame);
	driver.findElement(By.xpath("/html[1]/body[1]/p[5]/button[1]")).click();
	
	driver.switchTo().defaultContent();
	
	WebElement Result_frame = driver.findElement(By.xpath("//frame[@Name='tgt']"));
	driver.switchTo().frame(Result_frame);
	
	String txt = driver.findElement(By.className("SC")).getText();
	assertTrue(txt.contains("Testimonials"));
	
	Thread.sleep(1500);
	}
	
	
	@AfterMethod
	public void down() {
		driver.quit();
	}
	
}
