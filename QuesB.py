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
    SELECT cust.id, cust.name, SUM(il.quantity) AS total_books_purchased
    FROM customers cust
    JOIN invoices inv ON cust.id = inv.customer_id
    JOIN invoice_lines il ON inv.id = il.invoice_id
    GROUP BY cust.id, cust.name
    HAVING SUM(il.quantity) > 5;
""")

results = cursor.fetchall()

for row in results:
    print(row)