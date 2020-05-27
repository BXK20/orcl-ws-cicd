"""
Simple Python application to show CI/CD capabilities.
"""

from bottle import Bottle, route, run


app = Bottle()


@app.rout('/decrease/<salary>/<amount>')
def decrease(salary, amount):
    return salary - amount


@app.rout('/addition/<salary>/<amount>')
def addition(salary, amount):
    return salary + amount


@app.rout('/increment/<salary>/<percentage>')
def increment(salary, percentage):
    return salary * (1 + percentage/100)


if __name__ == '__main__':
    run(app, host='0.0.0.0', port=8080)
