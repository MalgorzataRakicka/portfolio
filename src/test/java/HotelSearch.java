import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

public class HotelSearch extends DriverHelper {

    @Test
    public void searchHotel(){

        MainPage mainPage = new MainPage(driver);
        mainPage.nameOfvoid();

    }

       /* driver.findElement(By.xpath("//span[text()='Search by Hotel or City Name']")).click();
        driver.findElement(By.xpath("//div[@id='select2-drop']//input")).sendKeys("Dubai");
        driver.findElement(By.xpath("//span[@class='select2-match' and text()='Dubai']")).click();
        driver.findElement(By.name("checkin")).sendKeys("17/04/2021");
        driver.findElement(By.name("checkout")).sendKeys("20/04/2021");

        driver.findElement(By.id("travellersInput")).click();
        driver.findElement(By.id("adultPlusBtn")).click();
        driver.findElement(By.id("childPlusBtn")).click();

        driver.findElement(By.xpath("//button[text()=' Search']")).click();
       List<String> hotelNames =  driver.findElements(By.xpath("//h4[contains(@class,'list_title')]//b")).stream().map(el ->el.getText()).collect(Collectors.toList());


        Assert.assertEquals("Jumeirah Beach Hotel", hotelNames.get(0));
        Assert.assertEquals("Oasis Beach Tower", hotelNames.get(1));
        Assert.assertEquals("Rose Rayhaan Rotana", hotelNames.get(2));

    }*/



    @Test
    public void searchHotelWhenCityNotFilled(){}
            //zgłoś buga, że nie można wyczyscić oraz ulepszenie, że puste powinno oznaczać "cokolwiek"


    @Test
    public void searchHotelWhenCheckinNotFilled(){}


}

