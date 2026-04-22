CREATE TABLE dim_customers (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    pet_type TEXT,
    pet_breed TEXT,
    pet_category TEXT,
    country TEXT,
    city TEXT
);

CREATE TABLE dim_sellers (
    seller_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    country TEXT
);

CREATE TABLE dim_stores (
    store_id SERIAL PRIMARY KEY,
    name TEXT,
    country TEXT,
    city TEXT
);

CREATE TABLE dim_products (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    category TEXT,
    brand TEXT,
    price NUMERIC(10,2),
    rating NUMERIC(3,2),
    supplier_name TEXT,
    supplier_country TEXT
);

CREATE TABLE fact_sales (
    sale_id SERIAL PRIMARY KEY,
    sale_date DATE,
    customer_id INT REFERENCES dim_customers(customer_id),
    seller_id INT REFERENCES dim_sellers(seller_id),
    product_id INT REFERENCES dim_products(product_id),
    store_id INT REFERENCES dim_stores(store_id),
    quantity INT,
    total_price NUMERIC(12,2)
);