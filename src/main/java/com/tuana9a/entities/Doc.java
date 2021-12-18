package com.tuana9a.entities;


import lombok.*;

@Getter
@Setter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class Doc {
    private String url;
    private String content;
}
