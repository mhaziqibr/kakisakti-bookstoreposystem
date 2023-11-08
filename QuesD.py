import mysql.connector

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='root9595',
    database="bookingposystem"
)

cursor = mydb.cursor()

#cursor.execute("SELECT * FROM customers")
cursor.execute("""
    SELECT il.description AS book_description, il.unit_price, il.quantity, il.sub_total, il.total, cust.name AS customer_name
    FROM invoice_lines il
    JOIN invoices inv ON il.invoice_id = inv.id
    JOIN customers cust ON inv.customer_id = cust.id;
""")

results = cursor.fetchall()

for row in results:
    print(row)