from flask import Flask, render_template, Response, request, redirect
import io
import pandas as pd
import pymssql as sql
from matplotlib.backends.backend_agg import FigureCanvasAgg as FigureCanvas
import matplotlib.pyplot as plt

from os import getenv
from dotenv import load_dotenv
load_dotenv()

server = getenv("PYMSSQL_TEST_SERVER")
user = getenv("PYMSSQL_TEST_USERNAME")
password = getenv("PYMSSQL_TEST_PASSWORD")
db_name = getenv("PYMSSQL_DB_NAME")

conn = sql.connect(server, user, password, db_name)

app = Flask(__name__)

querys = [
    {
        'query': """
    SELECT production.categories.category_name, COUNT(*) AS NumeroProdotti FROM production.products
    INNER JOIN production.categories
    ON production.products.category_id = production.categories.category_id
    GROUP BY production.products.category_id, production.categories.category_name
    ORDER BY NumeroProdotti DESC
    """,
        'title': 'category_name',
        'values': 'NumeroProdotti'
    },
    {
        'query': """
    SELECT sales.stores.store_name, COUNT(*) AS NumeroOrdini FROM sales.stores
    INNER JOIN sales.orders
    ON sales.orders.store_id = sales.stores.store_id
    GROUP BY sales.stores.store_id, sales.stores.store_name
    """,
        'title': 'store_name',
        'values': 'NumeroOrdini'
    },
    {
        'query': """
    SELECT production.brands.brand_name, COUNT(*) AS NumeroProdotti FROM production.products
    INNER JOIN production.brands
    ON production.brands.brand_id = production.products.brand_id
    GROUP BY production.products.brand_id, production.brands.brand_name
    """,
        'title': 'brand_name',
        'values': 'NumeroProdotti'
    }
]
product_selected = ''
graph = io.BytesIO()
number_selected = 0
df = pd.read_sql(querys[number_selected]['query'], conn)


@app.route("/", methods=["GET", "POST"])
def home():
    global df
    global number_selected
    global graph

    if request.method == "GET":
        df = pd.read_sql(querys[number_selected]['query'], conn)

        fig = plt.figure()
        ax = plt.axes()

        ax.bar(list(df[querys[number_selected]['title']]), list(df[querys[number_selected]['values']]))
        fig.autofmt_xdate(rotation=45)
        output = io.BytesIO()
        FigureCanvas(fig).print_png(output)
        graph = output.getvalue()

        return render_template('newhome.html', graph=df.to_html(classes='table table-striped', border=0), number_selected=number_selected)

    elif request.method == "POST":
        number = request.form.get('inputnumber')
        number_selected = int(number)

        return redirect('/')


@app.route("/getbyname")
def getbyname():
    global product_selected

    # cur = conn.cursor(as_dict=True)
    # cur.execute("SELECT * FROM production.products WHERE product_name LIKE %s", f"%{product_selected}%")
    # df = pd.DataFrame(cur.fetchall())

    df = pd.read_sql("SELECT * FROM production.products WHERE product_name LIKE %(q)s", conn, params={"q": f"%{product_selected}%"})

    return render_template('getByName.html', graph=df.to_html(classes='table table-striped', border=0), product_selected=product_selected)


@app.route('/graph.png')
def plot_png():
    return Response(graph, mimetype='image/png')


@app.route('/search', methods=['GET'])
def search():
    global product_selected
    product_selected = request.args.get('productname')

    return redirect('/getbyname')


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
