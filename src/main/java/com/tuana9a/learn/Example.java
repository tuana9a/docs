package com.tuana9a.learn;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Example {
    static class YourDataType {

    }

    public static void main(String[] args) {
        List<YourDataType> arrayList0 = new ArrayList<YourDataType>();
        System.out.println(arrayList0);
        List<YourDataType> arrayList1 = new ArrayList<YourDataType>(100);// khởi tạo 100 phần tử
        System.out.println(arrayList1);
        ArrayList<YourDataType> arrayList2 = new ArrayList<YourDataType>();
        System.out.println(arrayList2);
        // thêm các phần tử
        ArrayList<Integer> arrayList3 = new ArrayList<Integer>() {
            {
                add(10);
                add(2);
                add(3);
            }
        };
        System.out.println(arrayList3);
        ArrayList<Integer> arrayList4 = new ArrayList<>(Arrays.asList(1, 2, 3));
        System.out.println(arrayList4);
    }
}
