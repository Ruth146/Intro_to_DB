MySQLServer.py
Script to create the database alx_book_store
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (adjust user/password/host to your setup)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="your_password"   # replace with your MySQL root password
        )

        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
    
    except Error as e:
        print(f"Error while connecting to MySQL: {e}")
    
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            # print("MySQL connection closed.")   # Optional

if __name__ == "__main__":
    create_database()
