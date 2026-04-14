CREATE TABLE dim_geography (
    geo_id SERIAL PRIMARY KEY,
    country TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT,
    UNIQUE (country, city, state, postal_code)
);

CREATE TABLE dim_pets (
    pet_id SERIAL PRIMARY KEY,
    pet_type TEXT,
    pet_name TEXT,
    pet_breed TEXT,
    pet_category TEXT
);

CREATE TABLE dim_suppliers (
    supplier_id SERIAL PRIMARY KEY,
    name TEXT,
    contact_name TEXT,
    email TEXT,
    phone TEXT,
    address TEXT,
    geo_id INT REFERENCES dim_geography(geo_id)
);

CREATE TABLE dim_customers (
    customer_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INT,
    email TEXT,
    pet_id INT REFERENCES dim_pets(pet_id),
    geo_id INT REFERENCES dim_geography(geo_id)
);

CREATE TABLE dim_sellers (
    seller_id SERIAL PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    geo_id INT REFERENCES dim_geography(geo_id)
);

CREATE TABLE dim_stores (
    store_id SERIAL PRIMARY KEY,
    name TEXT,
    phone TEXT,
    email TEXT,
    location_address TEXT,
    geo_id INT REFERENCES dim_geography(geo_id)
);

CREATE TABLE dim_products (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    category TEXT,
    brand TEXT,
    price NUMERIC(10,2),
    weight TEXT,
    color TEXT,
    material TEXT,
    rating NUMERIC(3,2),
    supplier_id INT REFERENCES dim_suppliers(supplier_id)
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