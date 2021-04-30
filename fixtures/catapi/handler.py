import requests

BASE_URL = 'https://api.thecatapi.com/v1/images/search?format=json'

headers = {
  'x-api-key': '12345'
}

def handler(req):
    # authenticate request by sending api key in headers as specified in the catapi documentation
    kitties = requests.get(BASE_URL, headers=headers)

    # returns the (hopefully 200) response for kitties
    return kitties.json()
