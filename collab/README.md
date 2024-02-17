# Google Colab Notebook: MySQL Database Setup

## Overview

This Google Colab notebook guides you through the process of setting up a MySQL database using the `createguitar.sql` file. The notebook covers the following steps:

1. **Download the `createguitar.sql` File:**
   - Execute the cell to download the `createguitar.sql` file.
     ```python
     !wget https://raw.githubusercontent.com/SA6246/NYU_Tandon_Databases_Spring/main/createguitar.sql createguitar.sql
     ```

2. **Install Dependencies:**
   - Install MySQL Python dependencies and MySQL server.
     ```python
     !pip install mysql-connector-python
     !apt-get -y install mysql-server
     ```

3. **Start MySQL Server:**
   - Execute the following cells to start the MySQL server, change the password, source the tables, and exit from the server console.
     ```python
     !service mysql start
     !mysql -u root -proot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'root'; source createguitar.sql;"
     !mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY 'root';FLUSH PRIVILEGES;"
     ```

4. **Query MySQL Database:**
   - Execute the remaining cells to connect to the MySQL server, execute a sample query, and display the results using a Pandas DataFrame.

Feel free to modify the notebook to test your queries and explore the MySQL database. Happy coding!
