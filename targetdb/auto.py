import psycopg2
import json

# Database connection parameters
db_params = {
    'dbname': 'db2',
    'user': 'postgres',
    'password': 'Psql5',
    'host': 'localhost',  
    'port': '5432'  
}

# Sample JSON data
json_data = [
    {"member_id": 2, "loan_date": "2024-01-05", "book_id": 2, "loan_id": 1, "return_date": "2024-11-11"},
    {"member_id": 3, "loan_date": "2024-01-12", "book_id": 24, "loan_id": 2, "return_date": "2024-03-07"}
]

try:
    
    conn = psycopg2.connect(**db_params)
    cursor = conn.cursor()

    for record in json_data:
        member_id = record["member_id"]
        table_name = f"loan_history_member_{member_id}"
        
        # SQL command to create a loan history table for the member
        create_table_query = f"""
        CREATE TABLE IF NOT EXISTS {table_name} (
            loan_id SERIAL PRIMARY KEY,
            data JSONB NOT NULL
        )
        """
        # Execute the SQL command to create the table
        cursor.execute(create_table_query)
        print(f"Created or verified existence of table: {table_name}")

        # Insert JSON data into the respective member's table
        insert_query = f"INSERT INTO {table_name} (data) VALUES (%s)"
        cursor.execute(insert_query, [json.dumps(record)])
        print(f"Inserted data into {table_name}: {record}")

    # Commit the changes
    conn.commit()

except (Exception, psycopg2.DatabaseError) as error:
    print(f"Error: {error}")
finally:
    if conn:
        cursor.close()
        conn.close()
        print("Database connection closed.")
