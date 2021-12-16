import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
    @ExceptionHandler
    public ResponseEntity<JsonResponse> exception(Exception e) {
        e.printStackTrace();
        return responseUtils.internalServerError(e);
    }
}