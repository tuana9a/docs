import org.springframework.transaction.annotation.Transactional;

/**
 * @Transactional như cái tên đã nêu lên tất cả, là một transaction với db
 * 
 *                đặt ở class thì toàn bộ các method của chúng sẽ được kế thừa
 * 
 *                đặt ở phương thức (method) thì chỉ phương thức đó được wrap
 *                trong transaction
 */

@Transactional
public class TestService {

    @Transactional(rollbackFor = { NullPointerException.class }, timeout = 15000)
    public void update(User user) {
        // do some update here
    }

}
