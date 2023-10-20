CREATE TABLE guests(
    g_id BIGSERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(75) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(30),
    check_in_date DATE,
    check_out_date DATE
);

CREATE TABLE rooms(
   r_id BIGSERIAL PRIMARY KEY,
   room_number SMALLINT UNIQUE CHECK ( room_number > 0 ),
   room_type VARCHAR(20),
   room_capacity SMALLINT,
   price DECIMAL(8,2) CHECK ( price > 0 ),
   availability BOOLEAN NOT NULL
);

CREATE TABLE bookings(
    b_id BIGSERIAL PRIMARY KEY,
    guest_id BIGINT REFERENCES guests(g_id),
    room_id BIGINT REFERENCES rooms(r_id)
);

CREATE TABLE payments(
    p_id BIGSERIAL PRIMARY KEY,
    booking_id BIGINT REFERENCES bookings(b_id),
    payment_date DATE,
    payment_method VARCHAR(50),
    currency VARCHAR(10),
    total_amount DECIMAL(10,2),
    is_paid BOOLEAN NOT NULL
);

INSERT INTO guests (name, surname, email, phone_number, check_in_date, check_out_date) VALUES
    ('John', 'Doe', 'johndoe@gmail.com', '+1-234-567-8901', '2023-01-01', '2023-01-05'),
    ('Jane', 'Smith', 'janesmith@yahoo.com', '+44-791-234-5678', '2023-02-14', '2023-02-18'),
    ('Bob', 'Johnson', 'bob.johnson@hotmail.com', '+61-412-345-678', '2023-03-20', '2023-03-25'),
    ('Alice', 'Brown', 'alicebrown@gmail.com', '+33-6-78-90-12-34', '2023-04-10', '2023-04-15'),
    ('David', 'Lee', 'david.lee@outlook.com', '+81-90-1234-5678', '2023-05-05', '2023-05-10');

INSERT INTO rooms (room_number, room_type, room_capacity, price, availability) VALUES
    (101, 'Single', 1, 75.00, false),
    (102, 'Double', 2, 100.00, true),
    (201, 'Single', 1, 80.00, true),
    (202, 'Double', 2, 110.00, false),
    (301, 'Suite', 4, 200.00, true);

INSERT INTO bookings (guest_id, room_id) VALUES
    (1, 1),
    (2, 3),
    (3, 4),
    (4, 2),
    (5, 5);

INSERT INTO payments (payment_date, payment_method, currency, total_amount, is_paid) VALUES
    ('2023-01-01', 'Credit Card', 'USD', 375.00, true),
    ('2023-02-14', 'Cash', 'GBP', 160.00, true),
    ('2023-03-20', 'Bank Transfer', 'AUD', 800.00, false),
    ('2023-04-10', 'Credit Card', 'EUR', 550.00, true),
    ('2023-05-05', 'PayPal', 'JPY', 1000.00, false);