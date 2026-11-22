# ism3232-final_project
the two .read runs

SQLite version 3.43.2 2023-10-10 13:08:14
Enter ".help" for usage hints.
sqlite> .read schema.sql
sqlite> .tables
change_requests  claims           denials        
sqlite> SELECT COUNT(*) FROM claims;
9
sqlite> .read schema.sql
sqlite> SELECT COUNT(*) FROM denials;
5
sqlite> .read schema.sql
sqlite> SELECT COUNT(*) FROM change_requests;
0
sqlite> .quit
(.venv) isabelcruz@Isabels-MacBook-Pro-8 module07_final_project % sqlite3 coralbayhospital.db
SQLite version 3.43.2 2023-10-10 13:08:14
Enter ".help" for usage hints.
sqlite> .read schema.sql
sqlite> .tables
change_requests  claims           denials        
sqlite> SELECT COUNT(*) FROM change_requests;
0
sqlite> SELECT COUNT(*) FROM claims;
9
sqlite> SELECT COUNT(*) FROM denials;
5
sqlite> .read schema.sql
sqlite> 




