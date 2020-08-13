from flask import Flask, render_template
app = Flask(__name__)


@app.route('/')
def index():
    user = {'username': 'Susanne Brockmann'}
    return render_template('index.html', title='Home', user=user)

@app.route('/hello')
def HelloWorld():
    return "Hello World"

if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=5000)
