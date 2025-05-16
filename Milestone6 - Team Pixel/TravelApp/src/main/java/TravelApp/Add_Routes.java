package TravelApp;

import java.sql.Date;
import java.sql.Time;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

public class Add_Routes
{
	WebDriver driver;
	
	Add_Routes(WebDriver driver){
		this.driver = driver;
	}
	
		By From = By.xpath("//input[@name='rFrom']");
		By To = By.xpath("//input[@name='rTo']");
		By Travel_Id = By.xpath("//input[@name='TravelsId']");
		By Bus_Id = By.xpath("//input[@name='BusId']");
		By Departure = By.xpath("//input[@name='Departure']");
		By Arrival = By.xpath("//input[@name='Arrival']");
		By Fare = By.xpath("//input[@name='Fare']");
		By datepicker = By.xpath("//input[@id='datepicker']");
		By Submit = By.xpath("//input[@value='Submit']");
		By clr = By.xpath("//input[@value='Clear']");
	
	public void setValues(String from,String to,String travel_Id ,String bus_Id, String departure, String arrival, String fare, String date) {
		driver.findElement(From).sendKeys(from);
		driver.findElement(To).sendKeys(to);
		driver.findElement(Travel_Id).sendKeys(travel_Id);
		driver.findElement(Bus_Id).sendKeys(bus_Id);
		driver.findElement(Departure).sendKeys(departure);
		driver.findElement(Arrival).sendKeys(arrival);
		driver.findElement(Fare).sendKeys(fare);
		driver.findElement(datepicker).sendKeys(date);
		
	}
	public void submit_btn()
	{
		
		driver.findElement(Submit).click();
	}

	public void clear_btn()
	{
		
		driver.findElement(clr).click();
		
	}
}
