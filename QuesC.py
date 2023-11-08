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
    SELECT cust.id, cust.name, cust.email, cust.tel
    FROM customers cust
    LEFT JOIN invoices inv ON cust.id = inv.customer_id
    WHERE inv.id IS NULL;
""")

results = cursor.fetchall()

for row in results:
    print(row)