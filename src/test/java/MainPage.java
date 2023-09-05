import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

public class MainPage extends DriverHelper {

    @FindBy ()
    private WebElement element1;

    public MainPage (WebDriver driver){
        PageFactory.initElements(driver, this);
        this.driver=driver;
    }

    public void nameOfvoid(){
        element1.click();
    }
}
