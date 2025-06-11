from pytest_bdd import scenarios, given, when, then, parsers
import requests

scenarios('../features/status_check.feature')

# Shared context to store response
class Context:
    response = None

context = Context()

@given('the API is available')
def api_available():
    print("Assuming API is available")

@when(parsers.parse('I call the endpoint "{endpoint}"'))
def call_endpoint(endpoint):
    url = f"https://httpbin.org/{endpoint}"
    context.response = requests.get(url)
    print(f"Calling URL: {url}")

@then(parsers.parse('the response code should be {expected_code:d}'))
def check_response_code(expected_code):
    assert context.response.status_code == expected_code, \
        f"Expected {expected_code}, got {context.response.status_code}"

@then('the response body should be empty')
def check_empty_body():
    assert context.response.text == '', "Expected empty body"

@then('the Content-Type should be "text/html"')
def check_content_type():
    content_type = context.response.headers.get("Content-Type", "")
    print(f"Content-Type received: {content_type}")
    assert "text/html" in content_type
