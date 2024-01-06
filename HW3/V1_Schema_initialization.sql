CREATE TABLE products (
    pid BIGSERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10, 2),
    quantity INT,
    date_added DATE,
    supplier VARCHAR(50),
    description TEXT,
    product_image bytea
);

CREATE TABLE users (
    uid BIGSERIAL PRIMARY KEY,
    user_type VARCHAR(20) CHECK (user_type IN ('customer', 'employee')),
    user_password VARCHAR(50),
    name VARCHAR(30),
    surname VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(30),
    registration_date DATE
);

CREATE TABLE order_product(
    oid BIGSERIAL PRIMARY KEY,
    product_id BIGINT REFERENCES products(pid),
    user_id BIGINT REFERENCES users(uid)
);

CREATE TABLE basket(
    bid BIGSERIAL PRIMARY KEY,
    order_id BIGINT REFERENCES order_product(oid),
    quantity_of_product INT,
    order_date DATE,
    order_status VARCHAR(30),
    delivery_address VARCHAR(200),
    delivery_information TEXT,
    delivery_price DECIMAL(5, 2)
);

CREATE TABLE payments(
    payment_id BIGSERIAL PRIMARY KEY,
    basket_id BIGINT REFERENCES basket(bid),
    payment_amount DECIMAL(20, 2),
    date_of_payment DATE,
    payment_card INT,
    transaction_number INT,
    payment_currency VARCHAR(5)
);

CREATE TABLE reviews(
    rid BIGSERIAL PRIMARY KEY,
    order_id BIGINT REFERENCES order_product(oid),
    product_rating INT,
    review_text TEXT,
    publication_date DATE,
    number_of_likes INT,
    number_of_dislikes INT,
    review_image bytea,
    feedback_text TEXT
);
