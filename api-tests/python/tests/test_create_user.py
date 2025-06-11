# api-tests/python/tests/test_create_user.py
# Purpose: Test creating a new user via POST request to the JSONPlaceholder API.

import requests

def test_create_user():
    """
    Test that a new user can be created and the response contains the correct fields.
    """
    payload = {"name": "John Doe", "email": "john.doe@example.com"}
    response = requests.post("https://jsonplaceholder.typicode.com/users", json=payload)
    assert response.status_code == 201
    assert "id" in response.json()
    assert response.json()["name"] == "John Doe"
