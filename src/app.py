from flask import Flask, render_template
import os
app = Flask(__name__)


@app.route('/')
def index():
    """Render index.html."""
    user = {'username': 'Susanne Brockmann'}
    return render_template('index.html', title='Home', user=user)

@app.route('/hello')
def hello_world():
    """Print Hello World. Used for testing a second route."""
    return "Hello World"

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=80)
