import sqlite3
import os

DB_FILENAME = "parking.db"
INIT_SCRIPT_PATH = os.path.join(os.path.dirname(__file__), "init_db.sql")

def get_connection():
    conn = sqlite3.connect(DB_FILENAME)
    conn.row_factory = sqlite3.Row
    return conn

def init_db():
    if not os.path.exists(DB_FILENAME):
        conn = get_connection()
        with open(INIT_SCRIPT_PATH, "r", encoding="utf-8") as f:
            conn.executescript(f.read())
        conn.commit()
        conn.close()

init_db()