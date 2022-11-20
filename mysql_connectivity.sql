import java.sql.*;
public class MySQLProcedure {
public static void main(String[] args) {
try{
Class.forName("com.mysql.jdbc.Driver");
Connection c =
DriverManager.getConnection("jdbc:mysql://
localhost: 3306/ db1","root", "");
Statement sm = c.createStatement();Sample program(cont)
int ch;
do {
System.out.println("Enter Chice \n 1.Insert \n 2.Select \n
3.Update \n 4.Delete \n 5.Exit ");
ch=s.nextInt();
switch (ch) {
case 1: sql = “Insert into stud values (‘Ankita’ ,1)";
sm.executeUpdate(sql);
System.out.println(“Record is Inserted");
break;
//Sample program(cont)
case 2: String sql = "SELECT name, age FROM stud";
ResultSet rs = sm.executeQuery(sql);
while(rs.next())
{
String name1 = rs.getString("name");
int rno1 = rs.getInt(“rno");
System.out.print("name " + name1);
System.out.println(", Age: " + rno1);
}
break;
//Sample program(cont)
case 3: sql = “update stud set name=‘Mona’ where name=‘Ankita’ ";
sm.executeUpdate(sql);
System.out.println(“Record is updated");
break;
case 4: sql = “delete from stud where rno=1";
sm.executeUpdate(sql);
System.out.println(“Record is deleted");
break;
} }while(ch<5);
}
catch(Exception e){
e.printStackTrace();
} } }