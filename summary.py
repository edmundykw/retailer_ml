import duckdb

# Connect to the database
conn = duckdb.connect("/home/edmund/retailer_ml/models/raw/raw_retailer_db.duckdb")

# Get list of tables
tables = conn.execute(
    "SELECT table_name FROM information_schema.tables WHERE table_schema='main'"
).fetchall()

print(f"\nNumber of tables in database: {len(tables)}")

print("Table names:")
for t in tables:
    print(f"- {t[0]}")

print("\nTables in database:")
for table in tables:
    print(f"- {table[0]}")

    # Get schema for each table
    schema = conn.execute(f"DESCRIBE {table[0]}").fetchall()
    print("\nSchema:")
    for col in schema:
        print(f"  {col[0]}: {col[1]}")

    # Preview data
    data = conn.execute(f"SELECT * FROM {table[0]} LIMIT 5").fetchall()
    print("\nFirst 5 rows:")
    for row in data:
        print(f"  {row}")
    print("\n---")

# Close connection
conn.close()