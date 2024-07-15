import os
import requests
import psycopg2
from dotenv import load_dotenv


# Access the Yelp API Key
API_KEY = 'ZgGu6dCt0YgZOTStjTyyPAoh-B0N3sAOrm0pioNf_gPBy0JPvq8Uk_9QzAKqSTDoekueFUyWpW31V1VmaHlrEpYIn2MhzMwSJB7QpJ9LzZNHM10HRv0U3AuVPQ5-ZnYx'

# Yelp API Endpoint
url = 'https://api.yelp.com/v3/businesses/search'

# Parameters for the API request
params = {
    'term': 'hotels',  # or 'restaurants'
    'location': 'Denver, CO',  # Change to your desired location
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
    
    # Check if the API request was successful
    if response.status_code == 200:
        data = response.json()
        print("API Response:", data)
        return data
    else:
        print("API Request Failed. Status Code:", response.status_code)
        print("Error Message:", response.text)
        return None

# Connect to PostgreSQL
def connect_to_db():
    conn = psycopg2.connect(
        host="localhost",
        database="yelp_data",
        user="postgres",
        password="password" # Change this to your actual SQl password.
    )
    return conn

# Insert data into PostgreSQL
def insert_data(conn, table, data):
    if data is None:
        print("No data to insert.")
        return
    
    if 'businesses' in data:
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
    else:
        print("No 'businesses' key in the data.")

# Main function to fetch and store data
def main():
    conn = connect_to_db()
    
    # Fetch and insert hotel data
    hotel_data = fetch_yelp_data('hotels', 'Denver, CO')
    insert_data(conn, 'hotels', hotel_data)
    
    # Fetch and insert restaurant data
    restaurant_data = fetch_yelp_data('restaurants', 'Denver, CO')
    insert_data(conn, 'restaurants', restaurant_data)

    disp_data = fetch_yelp_data('dispensary', 'Denver, CO')
    insert_data(conn, 'dispensaries', disp_data)
    
    conn.close()

if __name__ == '__main__':
    main()
