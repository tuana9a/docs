# Database Concepts

# Dirty Read

A Dirty read is the situation<br>
when a transaction reads a data that has not yet been committed

For example, Let's say transaction 1 updates a row and leaves it uncommitted,<br>
meanwhile, Transaction 2 reads the updated row.

If transaction 1 rolls back the change,<br>
transaction 2 will have read data that is considered never to have existed.

cái này thì chưa thấy sảy ra <br>
vì phải update thì thằng read mới nhận đc bản update, có thể isolate sẵn r :V

# Nonrepeatable (Fuzzy) Reads

Non Repeatable read occurs when a transaction reads same row twice,<br>
and get a different value each time. <br>

For example, suppose transaction T1 reads data <br>

Due to concurrency, another transaction T2 updates the same data and commit <br>
Now if transaction T1 rereads the same data, it will retrieve a different value. <br>

chính là tính huống thành commit cuối là thằng win trong việc cộng tiền

# Phantom Reads

Phantom Read occurs when two same queries are executed, but the rows retrieved by the two, are different <br>

For example, suppose transaction T1 retrieves a set of rows that satisfy some search criteria. <br>
Now, Transaction T2 generates some new rows that match the search criteria for transaction T1. <br>

If transaction T1 re-executes the statement that reads the rows, it gets a different set of rows this time. <br>
tức là cursor của một thằng nếu chạy hết thì có 5 like, <br>
nhưng lúc chạy thực tế lại có 10 like (trong lúc read đã có ng like thêm), <br>
hoặc lịch sử chuyển tiền, số lượng thì bảo 5 nhưng danh sách lại có 6?

# Tóm lại

nói chung các isolation level đều đảm bảo tính nhất quán của row, <br>
đa số thường ném ra lỗi nếu như xử lí xong xong, <br>
thường là deadlock hoặc không lấy được lock key</p>
