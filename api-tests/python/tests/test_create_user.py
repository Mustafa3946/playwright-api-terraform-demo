# api-tests/python/tests/test_create_user.py
import requests

def test_create_user():
    payload = {"name": "John Doe", "email": "john.doe@example.com"}
    response = requests.post("https://jsonplaceholder.typicode.com/users", json=payload)
    assert response.status_code == 201
    assert "id" in response.json()
    assert response.json()["name"] == "John Doe"
