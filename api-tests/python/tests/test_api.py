# api-tests/python/tests/test_api.py
import requests

BASE_URL = "https://jsonplaceholder.typicode.com"


def test_get_users():
    url = f"{BASE_URL}/users"
    response = requests.get(url)

    print(f"Requesting URL: {url}")
    print(f"Status Code: {response.status_code}")
    assert response.status_code == 200, "Status code is not 200"

    data = response.json()
    assert isinstance(data, list), "Response is not a list"
    assert len(data) == 10, "Expected 10 users"

    print(f"Fetched {len(data)} users.")
    print("First user sample:", data[0])

    for user in data:
        assert "id" in user and isinstance(user["id"], int), f"User missing 'id': {user}"
        assert "email" in user and "@" in user["email"], f"Invalid email: {user.get('email')}"


def test_specific_user_exists():
    response = requests.get(f"{BASE_URL}/users")
    users = response.json()

    usernames = [u["username"] for u in users]
    print("Usernames:", usernames)
    assert "Bret" in usernames, "User 'Bret' not found"


def test_user_json_structure():
    response = requests.get(f"{BASE_URL}/users")
    user = response.json()[0]

    expected_keys = {
        "id", "name", "username", "email", "address", "phone", "website", "company"
    }
    print("Keys in user:", user.keys())
    assert expected_keys.issubset(user.keys()), f"Missing keys: {expected_keys - user.keys()}"
