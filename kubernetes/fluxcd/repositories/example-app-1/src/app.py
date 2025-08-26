from http.server import BaseHTTPRequestHandler, HTTPServer
class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type","text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(b"Hello from example-app-1 v0.0.1")
HTTPServer(("", 80), Handler).serve_forever()
