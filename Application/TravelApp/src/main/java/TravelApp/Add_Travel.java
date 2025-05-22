package TravelApp;

import java.sql.Date;
import java.sql.Time;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class Add_Travel
{
	WebDriver driver;
	
	Add_Travel(WebDriver driver){
		this.driver = driver;
	}
	
		By TravelName = By.xpath("//input[@name='Travels']");
		By Address = By.xpath("//textarea[@name='Address']");
		By AgentName = By.xpath("//input[@name='AgentName']");
		By PhoneNumber = By.xpath("//input[@name='PhoneNumber']");
	
		By Submit = By.xpath("//input[@value='Submit']");
	
	public void setValues(String travelname ,String address, String agentname, String phonenumber) {
		driver.findElement(TravelName).sendKeys(travelname);
		driver.findElement(Address).sendKeys(address);
		driver.findElement(AgentName).sendKeys(agentname);
		driver.findElement(PhoneNumber).sendKeys(phonenumber);

	}
	public void submit_btn()
	{
		
		driver.findElement(Submit).click();
	}


}
