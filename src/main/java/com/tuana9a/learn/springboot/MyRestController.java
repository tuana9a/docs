package com.tuana9a.learn.springboot;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @RestController = @ResponseBody + @Controller
 *                 
 * @PathVariable   VD: "/name/:value" và với "/name/tuan" thì "value = tuan"
 * @RequestParam
 *               để mặc định thì request k có param sẽ fail
 *               chỉ cần có một trong 2 defaultValue or required = false
 *               thì không cần param cũng đc
 *               required = false sẽ trả về null
 * 
 * cả Path và Param nếu cast không thành công sẽ lỗi =V
 * 
 * @RequestBody Movie movie
 *              tự chuyển body của req từ json thành Object tương ứng
 */

@RestController("/api/rest")
public class MyRestController {
    @GetMapping("/get/:id")
    public Object get(@PathVariable(value = "id", required = false) String id,
            @RequestParam(value = "name", required = false, defaultValue = "tuana9a") String name) {
        System.out.println(id);
        System.out.println(name);
        return new Object();
    }

    @PostMapping("/post")
    public Object post(@RequestBody Object user) {
        System.out.println(user);
        return user;
    }
}
