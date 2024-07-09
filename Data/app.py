import threading
from flask import Flask, render_template, jsonify
import psycopg2
import os

app = Flask(__name__)


# Function to connect to the PostgreSQL database
def connect_to_db():
    conn = psycopg2.connect(
        host="localhost",
        database="yelp_data",
        user="postgres",
        password="'"
    )
    return conn

# Route to fetch and display hotel data
@app.route('/hotels')
def get_hotels():
    conn = connect_to_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM hotels;")
    hotels = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(hotels)

# Route to fetch and display restaurant data
@app.route('/restaurants')
def get_restaurants():
    conn = connect_to_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM restaurants;")
    restaurants = cursor.fetchall()
    cursor.close()
    conn.close()
    return jsonify(restaurants)

# Home route
@app.route('/')
def index():
    return ()

def run_app():
    app.run(debug=True, use_reloader=False, port=5001)

# Start Flask app in a separate thread
threading.Thread(target=run_app).start()

