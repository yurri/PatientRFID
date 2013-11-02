"""Only needed to redirect / requests to /folder application deployment at Webfaction hosting
If the app is installed in the root of the domain or you're using other hosting without these problems, remove this file
"""
class WebFactionMiddleware(object):
    def __init__(self, app):
        self.app = app
    def __call__(self, environ, start_response):
        environ['SCRIPT_NAME'] = '/patientrfid'
        return self.app(environ, start_response)

app.wsgi_app = WebFactionMiddleware(app.wsgi_app)