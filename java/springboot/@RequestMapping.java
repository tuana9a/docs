import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @RequestMapping có thể đặt ở trước class hoặc ở tên phương thức
 */
@RequestMapping("/api/here")
public class TestController {

    @RequestMapping(value = "/redirect", method = RequestMethod.GET)
    public String redirect() {
        return "/redirect.html";
    }
}
