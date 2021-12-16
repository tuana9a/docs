import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ResponseBody trả vẻ body dạng json
 * nếu đặt ở class thì toàn bộ method sẽ được kế thừa
 * đặt ở phương thức thì chỉ phương thức đó được nhận thôi
 */

@Controller
@ResponseBody
public class TestController {

    @ResponseBody
    public Object get() {
        return new Object();
    }
}
