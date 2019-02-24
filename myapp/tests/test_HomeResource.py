import falcon
from falcon import testing
import json
import pytest

from myapp.resources.app import api


@pytest.fixture
def client():
    return testing.TestClient(api)


# pytest will inject the object returned by the "client" function
# as an additional parameter.
def test_response_at_root(client):
    doc = {
        "response": [
            {
                "hello": "world",
            }
        ]
    }

    response = client.simulate_get('/')
    result_doc = doc

    assert result_doc == doc
    assert response.status == falcon.HTTP_OK