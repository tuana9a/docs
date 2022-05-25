# mysql allow remote login root

Created: July 28, 2021
Tags: mysql

# root

If you've got access to the mysql database, you can change the grant tables directly:

```sql
UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='username';
```

Also you might need to make changes to the mysql.db table as well:

```sql
UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='username';
```

and then flush to apply the privileges:

```sql
FLUSH PRIVILEGES;
```