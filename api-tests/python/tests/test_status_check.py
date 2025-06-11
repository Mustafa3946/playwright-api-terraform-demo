# Path: api-tests/python/tests/test_status_check.py
# Purpose: BDD step definitions for status check scenarios using pytest-bdd and httpbin.org.

from pytest_bdd import scenarios, given, when, then, parsers
import requests

scenarios('../features/status_check.feature')

class Context:
    # Shared context to store the HTTP response between steps
    response = None

context = Context()

@given('the API is available')
def api_available():
    """
    Assume the API is available for testing.
    """
    print("Assuming API is available")

@when(parsers.parse('I call the endpoint "{endpoint}"'))
def call_endpoint(endpoint):
    """
    Call the specified endpoint on httpbin.org and store the response in context.
    """
    url = f"https://httpbin.org/{endpoint}"
    context.response = requests.get(url)
    print(f"Calling URL: {url}")

@then(parsers.parse('the response code should be {expected_code:d}'))
def check_response_code(expected_code):
    """
    Assert that the response status code matches the expected value.
    """
    assert context.response.status_code == expected_code, \
        f"Expected {expected_code}, got {context.response.status_code}"

@then('the response body should be empty')
def check_empty_body():
    """
    Assert that the response body is empty.
    """
    assert context.response.text == '', "Expected empty body"

@then('the Content-Type should be "text/html"')
def check_content_type():
    """
    Assert that the Content-Type header contains 'text/html'.
    """
    content_type = context.response.headers.get("Content-Type", "")
    print(f"Content-Type received: {content_type}")
    assert "text/html" in content_type
