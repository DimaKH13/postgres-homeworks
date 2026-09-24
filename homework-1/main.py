import psycopg2
import csv

 
conn_params = {
    "host": "localhost",
    "database": "north",
    "user": "postgres",
    "password": "utkakryak"
}

def get_connection():
    return psycopg2.connect(**conn_params)

def insert_employees(cursor, filename):
    with open(filename, 'r', encoding='utf-8') as f:
        reader = csv.reader(f, quotechar='"')
        next(reader)
        for row in reader:
            cursor.execute(
                "INSERT INTO employees (employee_id, first_name, last_name, title, birth_date, notes) VALUES (%s, %s, %s, %s, %s, %s)",
                (int(row[0]), row[1], row[2], row[3], row[4], row[5])
            )

def insert_customers(cursor, filename):
    with open(filename, 'r', encoding='utf-8') as f:
        reader = csv.reader(f, quotechar='"')
        next(reader)
        for row in reader:
            cursor.execute(
                "INSERT INTO customers (customer_id, company_name, contact_name) VALUES (%s, %s, %s)",
                (row[0], row[1], row[2])
            )

def insert_orders(cursor, filename):
    with open(filename, 'r', encoding='utf-8') as f:
        reader = csv.reader(f, quotechar='"')
        next(reader)
        for row in reader:
            cursor.execute(
                "INSERT INTO orders (order_id, customer_id, employee_id, order_date, ship_city) VALUES (%s, %s, %s, %s, %s)",
                (int(row[0]), row[1], int(row[2]), row[3], row[4])
            )

def main():
    conn = None
    try:
        conn = get_connection()
        cursor = conn.cursor()
        
        print("Загрузка сотрудников...")
        insert_employees(cursor, 'north_data/employees_data.csv')
        
        print("Загрузка клиентов...")
        insert_customers(cursor, 'north_data/customers_data.csv')
        
        print("Загрузка заказов...")
        insert_orders(cursor, 'north_data/orders_data.csv')
        
        conn.commit()
        print("Все данные успешно загружены!")
        
    except Exception as e:
        print(f"Произошла ошибка: {e}")
        if conn:
            conn.rollback()
    finally:
        if conn:
            cursor.close()
            conn.close()

if __name__ == "__main__":
    main()