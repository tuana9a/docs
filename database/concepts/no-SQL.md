# no-SQL

cùng xem xem no sql có gì hay ho hơn có sql nhé

## pros

-   insert + retrive
-   Schema Change Easily
-   Scale Horizontal, Horizontal Partitioning
-   Metrics, Analytics

## cons

-   Not Guaranty Consistency<br>
    sử dụng transaction để **consist nhưng lại slow**, nên k có ý nghĩa lắm
-   Scale Horizontal, Horizontal Partitioning
-   Update Cost
-   Read not optimized<br>
    chỉ "tiện" khi read cả block,<br>
    nhưng khi chỉ cần 1 trường thuộc tính,<br>
    thì lại thành cons khi lúc nào cũng full document
