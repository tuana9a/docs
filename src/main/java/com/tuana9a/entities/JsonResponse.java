package com.tuana9a.entities;

import lombok.*;

@Builder
@Getter
@Setter
public class JsonResponse {
    private Integer code;
    private Object data;
    private String message;
}
