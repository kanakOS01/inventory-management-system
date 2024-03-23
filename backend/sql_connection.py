import mysql.connector

__conn = None

def get_sql_connection():
    global __conn
    if __conn == None:
        conn = mysql.connector.connect(user='root', password='Kin@ub01', host='127.0.0.1', database='inventory_system')

    return conn