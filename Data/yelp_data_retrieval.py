import os
import requests
import psycopg2
from dotenv import load_dotenv

# Load environment variables from .env file
load_dotenv()

# Access the Yelp API Key
API_KEY = os.getenv('YELP_API_KEY')

# Yelp API Endpoint
url = 'https://api.yelp.com/v3/businesses/search'

# Parameters for the API request
params = {
    'term': 'hotels',  # or 'restaurants'
    'location': 'Austin, TX',  # Change to your desired location
    'limit': 50  # Number of results per request
}

# Headers for the API request
headers = {
    'Authorization': f'Bearer {API_KEY}',
}

# Function to retrieve data from Yelp API
def fetch_yelp_data(term, location):
    params['term'] = term
    params['location'] = location
    response = requests.get(url, headers=headers, params=params)
    return response.json()

# Connect to PostgreSQL
def connect_to_db():
    conn = psycopg2.connect(
        host="localhost",
        database="yelp_data",
        user="postgres",
        password="Fucksql"
    )
    return conn

# Insert data into PostgreSQL
def insert_data(conn, table, data):
    cursor = conn.cursor()
    for item in data['businesses']:
        cursor.execute(f"""
            INSERT INTO {table} (name, address, city, state, zip_code, country, phone, rating, review_count, latitude, longitude, yelp_id)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            ON CONFLICT (yelp_id) DO NOTHING;
        """, (
            item['name'],
            item['location']['address1'],
            item['location']['city'],
            item['location']['state'],
            item['location']['zip_code'],
            item['location']['country'],
            item['phone'],
            item['rating'],
            item['review_count'],
            item['coordinates']['latitude'],
            item['coordinates']['longitude'],
            item['id']
        ))
    conn.commit()
    cursor.close()

# Main function to fetch and store data
def main():
    conn = connect_to_db()
    
    # Fetch and insert hotel data
    hotel_data = fetch_yelp_data('hotels', 'Austin, TX')
    insert_data(conn, 'hotels', hotel_data)
    
    # Fetch and insert restaurant data
    restaurant_data = fetch_yelp_data('restaurants', 'Austin, TX')
    insert_data(conn, 'restaurants', restaurant_data)
    
    conn.close()

if __name__ == '__main__':
    main()
