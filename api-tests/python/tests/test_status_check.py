from pytest_bdd import scenarios, given, when, then, parsers
import requests

scenarios('../features/status_check.feature')

@given('the API is available')
def api_available():
    # For this demo, we’ll assume the API is always available.
    pass

@when('I call the /status endpoint')
def call_status(request):
    request.response = requests.get("https://httpbin.org/status/200")

@then('the response code should be 200')
def check_status(request):
    assert request.response.status_code == 200
