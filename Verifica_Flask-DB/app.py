from flask import Flask, render_template, Response, request, redirect
import pymssql as sql

from os import getenv
from dotenv import load_dotenv
load_dotenv()

server = getenv("PYMSSQL_TEST_SERVER")
user = getenv("PYMSSQL_TEST_USERNAME")
password = getenv("PYMSSQL_TEST_PASSWORD")
db_name = getenv("PYMSSQL_DB_NAME")

conn = sql.connect(server, user, password, db_name)

app = Flask(__name__)
user_id = 1
data_edit = False


@app.route("/", methods=["GET", "POST"])
def home():
    global user_id
    global data_edit
    if request.method == "GET":

        cursor = conn.cursor(as_dict=True)
        q = 'SELECT * FROM sales.customers WHERE customer_id = %(uid)s'
        p = {'uid': user_id}
        cursor.execute(q, p)
        data = cursor.fetchall()

        if(len(data) == 0):
            return render_template('index.html', user_id=user_id,  display_error=True)

        else:
            if data_edit == True:
                data_edit = False
                return render_template('index.html', user_id=user_id, first_name=data[0]['first_name'], last_name=data[0]['last_name'], phone=data[0]['phone'], email=data[0]['email'], street=data[0]['street'], city=data[0]['city'], state=data[0]['state'], zip_code=data[0]['zip_code'], display_error=False, data_edit=True)
            else:
                return render_template('index.html', user_id=user_id, first_name=data[0]['first_name'], last_name=data[0]['last_name'], phone=data[0]['phone'], email=data[0]['email'], street=data[0]['street'], city=data[0]['city'], state=data[0]['state'], zip_code=data[0]['zip_code'], display_error=False, data_edit=False)

    elif request.method == "POST":
        user_id = request.form.get('user_id')

        return redirect('/')

@app.route("/edit", methods=["POST"])
def edit():
    global data_edit
    cursor = conn.cursor(as_dict=True)
    q = 'UPDATE sales.customers SET first_name=%(first_name)s, last_name=%(last_name)s,  phone=%(phone)s, email=%(email)s, street=%(street)s, city=%(city)s, state=%(state)s, zip_code=%(zip_code)s WHERE customer_id=%(customer_id)s'
    p = {'first_name': request.form['first_name'], 'last_name': request.form['last_name'], 'phone': request.form['phone'], 'email': request.form['email'], 'street':request.form['street'], 'city':request.form['city'], 'state':request.form['state'], 'zip_code':request.form['zip_code'], 'customer_id':request.form['customer_id']}

    cursor.execute(q, p)
    conn.commit()
    data_edit = True

    return redirect('/')


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=3000)