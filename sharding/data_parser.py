import csv
import json
import pymongo
from pprint import pprint

class Dataset:
    def __init__(self, filename):
        self.data = []
        with open(filename) as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                row['Year'] = int(row['Year'])
                row['Murder'] = int(row['Murder'])
                row['Assault on women'] = int(row['Assault on women'])
                row['Kidnapping and Abduction'] = int(row['Kidnapping and Abduction'])
                row['Robbery'] = int(row['Robbery'])
                row['Arson'] = int(row['Arson'])
                row['Hurt'] = int(row['Hurt'])
                row['Prevention of atrocities (POA) Act'] = int(row['Prevention of atrocities (POA) Act'])
                row['Protection of Civil Rights (PCR) Act'] = int(row['Protection of Civil Rights (PCR) Act'])
                row['Other Crimes Against SCs'] = int(row['Other Crimes Against SCs'])
                self.data.append(row)

class MongoProxy:
    def __init__(self, db, phost="localhost", pport=27017):
        self.client = pymongo.MongoClient(phost, pport)
        self.db = pymongo.database.Database(self.client, db)

    def insert_all(self, collectionName, data):
        self.db[collectionName].insert_many(data)

if __name__ == "__main__":
    ds = Dataset('crime_by_district.csv')
    mp = MongoProxy('hate_crime_india')
    mp.insert_all('crime_by_district', ds.data)