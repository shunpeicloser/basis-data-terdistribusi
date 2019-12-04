import requests

url = "http://eplanning.madiunkota.go.id/api/ws/ppas/final"

querystring = {"tahun":"2019"}

headers = {
    'pass': "sync_ekin_hamdiramadhan",
    'user': "sync_ekin",
    'cache-control': "no-cache",
    'postman-token': "1b35dc33-7783-f607-253b-4945be6526ea"
    }

response = requests.request("GET", url, headers=headers, params=querystring)

print(response.text)