import json
import falcon

api = application = falcon.API()


class HomeResource(object):
    def on_get(self, req, resp):
        doc = {
            "response": [
                {
                    "hello": "world",
                }
            ]
        }

        # Create a JSON representation of the resource
        resp.body = json.dumps(doc)

        # The following line can be omitted because 200 is the default
        # status returned by the framework, but it is included here to
        # illustrate how this may be overridden as needed.
        resp.status = falcon.HTTP_200


home = HomeResource()
api.add_route('/', home)
