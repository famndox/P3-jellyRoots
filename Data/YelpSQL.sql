-- Create table for hotels
CREATE TABLE hotels (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    country VARCHAR(100),
    phone VARCHAR(20),
    rating DECIMAL(2, 1),
    review_count INTEGER,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    yelp_id VARCHAR(100) UNIQUE
);

-- Create table for restaurants
CREATE TABLE restaurants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    country VARCHAR(100),
    phone VARCHAR(20),
    rating DECIMAL(2, 1),
    review_count INTEGER,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    yelp_id VARCHAR(100) UNIQUE
);

-- Create table for dispensaries
CREATE TABLE dispensaries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(20),
    country VARCHAR(100),
    phone VARCHAR(20),
    rating DECIMAL(2, 1),
    review_count INTEGER,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    yelp_id VARCHAR(100) UNIQUE
);