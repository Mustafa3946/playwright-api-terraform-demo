# api-tests/python/tests/test_api.py
import requests

def test_get_users():
    response = requests.get("https://jsonplaceholder.typicode.com/users")
    assert response.status_code == 200
    assert isinstance(response.json(), list)
