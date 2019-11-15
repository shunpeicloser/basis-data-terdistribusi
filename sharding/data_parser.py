import csv
import json
import pymongo
from pprint import pprint

class Dataset:
    def __init__(self, filename):
        with open(filename) as csvfile:
            reader = csv.DictReader(csvfile)
            self.data = list(reader)

class MongoProxy:
    def __init__(self, db, phost="localhost", pport=27017):
        self.client = pymongo.MongoClient(phost, pport)
        self.db = pymongo.database.Database(self.client, db)
        # pprint(self.db.command('serverStatus'))
    
    def testinsert(self, collectionName, data):
        self.db[collectionName].insert_one(data)

    def insert_all(self, collectionName, data):
        self.db[collectionName].insert_many(data)
        # pass

if __name__ == "__main__":
    ds = Dataset('crime_by_district.csv')
    mp = MongoProxy('hate_crime_india')
    mp.insert_all('crime_by_district', ds.data)
    # mp.testinsert('collection_1', {'test_id': 0, 'value': 1})