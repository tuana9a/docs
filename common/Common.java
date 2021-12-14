import java.util.List;
import java.lang.Integer;
import java.util.ArrayList;

public class Common {
    public static void main(String[] args) {
        System.out.println("123456789".substring(2, 5));
        // 

        List<Integer> arr = new ArrayList<Integer>();
        arr.add(1);
        arr.add(2);
        arr.add(3);

        // o1 < o2 then o1 go top
        // o1 > o2 then o1 go last
        arr.sort((o1, o2) -> {
            return o1 - o2;
        });
    }
}
