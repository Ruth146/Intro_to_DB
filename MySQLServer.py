#!/usr/bin/python3
"""
MySQLServer.py
Script to create the database alx_book_store
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    connection = None
    try:
        # Connect to MySQL server (adjust user/password/host to your setup)
        connection = mysql.connector.connect(
            host="localhost",
            user="root",
            password="your_password"   # replace with your MySQL password
        )

        # If connected, try to create database
        if connection.is_connected():
            cursor = connection.cursor()
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        # Explicit exception handling
        print(f"Error: {e}")

    finally:
        # Ensure resources are closed properly
        if connection and connection.is_connected():
            cursor.close()
            connection.close()

if __name__ == "__main__":
    create_database()
