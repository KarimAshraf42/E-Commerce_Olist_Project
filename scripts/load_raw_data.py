import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("postgresql://postgres:kikz123@localhost:5432/dbt_db")

files = {
    "customers": "data/olist_customers_dataset.csv",
    "geolocation":"data/olist_geolocation_dataset.csv",
    "order_items": "data/olist_order_items_dataset.csv",
    "order_payments":"data/olist_order_payments_dataset.csv",
    "order_reviews":"data/olist_order_reviews_dataset.csv",
    "orders": "data/olist_orders_dataset.csv",
    "products": "data/olist_products_dataset.csv",
    "sellers":"data/olist_sellers_dataset.csv",
    "product_category_name_translation":"data/product_category_name_translation.csv"
}

for table_name, file_path in files.items():
    df = pd.read_csv(file_path)
    df.to_sql(
        name=table_name,
        con=engine,
        schema="raw",
        if_exists="replace",
        index=False
    )
    print(f"✅ Loaded {table_name} successfully ({len(df)} rows)")
