package com.tuana9a.learn.springboot;
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
public class TransactionalService {

    @Transactional(rollbackFor = { NullPointerException.class }, timeout = 15000)
    public void update(Object user) {
        // do some update here
    }

}
