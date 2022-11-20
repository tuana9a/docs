# Hibernate

`hibernate.cfg.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE hibernate-configuration
SYSTEM "http://www.hibernate.org/dtd/hibernate-configuration-3.0.dtd">
<hibernate-configuration>
    <session-factory>
        <property name="hibernate.connection.url">jdbc:mysql://server:3306/database-name</property>
        <property name="hibernate.connection.username">username</property>
        <property name="hibernate.connection.password">password</property>
        <property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
        <!-- org.hibernate.dialect.MySQL5Dialect || org.hibernate.dialect.MySQL5InnoDBDialect -->
        <property name="hibernate.dialect">org.hibernate.dialect.MySQL5InnoDBDialect</property>
        <property name="hibernate.show_sql">true</property>
        <!-- create || update || validate -->
        <property name="hibernate.hbm2ddl.auto">validate</property>
        <!-- <mapping resource="Book.hbm.xml" /> -->
    </session-factory>
</hibernate-configuration>
```

# Examples

`Book.hbm.xml`

```xml
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD//EN" "http://www.hibernate.org/dtd/hibernate-mapping-3.0.dtd">

<hibernate-mapping>
    <class name="com.tuana9a.models.Book" table="book">
        <id name="id" type="long" column="id" />
        <property name="name" column="name" type="string" />
        <property name="publisher" column="publisher" type="string" />
    </class>
</hibernate-mapping>
```