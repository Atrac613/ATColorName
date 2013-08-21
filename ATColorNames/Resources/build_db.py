# -*- coding: utf-8 -*-

import os
import sqlite3
import json

def hex_to_rgb(v):
    if (v[0] == '#'):
        v = v[1:]
    
    assert(len(v) == 6)
    return int(v[:2], 16), int(v[2:4], 16), int(v[4:6], 16)

def rgb_to_hex(v):
    assert(len(v) == 3)
    return '#%02x%02x%02x' % v

def build(table_name, json_file):
    print 'Creating for %s.' % table_name
    
    # Database Connect
    con = sqlite3.connect(DATABASE_FILE)
    
    # Load Json
    json_data = open(json_file)
    data = json.load(json_data)
    
    # Create Table
    con.execute('CREATE TABLE IF NOT EXISTS %s (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, name_reading TEXT, red INTEGER, green INTEGER, blue INTEGER);' % table_name)
    
    # Insert Data
    for row in data:
        name = row['name']

        if 'name_reading' in row:
            name_reading = row['name_reading']
        else:
            name_reading = ''

        hex = row['hex']
        rgb = hex_to_rgb(hex)
        
        con.execute('INSERT INTO %s (name, name_reading, red, green, blue) VALUES (?, ?, ?, ?, ?)' % table_name, (name, name_reading, rgb[0], rgb[1], rgb[2]))
    
    # Results
    c = con.cursor()
    c.execute('SELECT count(*) FROM %s' % table_name)
    print 'Counts: %d' % c.fetchone()[0]
    
    c = con.cursor()
    c.execute('SELECT * FROM %s ORDER BY id DESC LIMIT 1' % table_name)
    print 'Last Result:'
    print 'ID:%d Name:%s(%s) R:%d G:%d B:%d' % c.fetchone()
    
    # Commit
    con.commit()
    
    # Database Close
    con.close()

BASE_DIR = './'
DATABASE_FILE = BASE_DIR + 'color_names.db'
INIT_DATABASE = True

# Remove if exists
if os.path.exists(DATABASE_FILE) and INIT_DATABASE:
    os.remove(DATABASE_FILE)

build('color_names_ja', BASE_DIR + 'color_names_ja.json')
build('color_names_en', BASE_DIR + 'color_names_en.json')

print 'Done.'