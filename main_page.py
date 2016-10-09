from bottle import route, template, static_file, request, default_app
import sqlite3
import settings


@route('/addnew', method='POST')
def addnew():
    product_name = request.forms.get('product_name')
    proteins = request.forms.get('proteins')
    kcal = request.forms.get('kcal')
    fats = request.forms.get('fats')
    carbs = request.forms.get('carbs')
    category = request.forms.get('category')
    conn = sqlite3.connect('main.db')
    cursor = conn.cursor()
    query = "INSERT INTO products (name, b, j, u, cal, cat) VALUES ('%s','%s','%s','%s','%s','%s')" \
            %(product_name, proteins, fats, carbs, kcal, category)
    cursor.execute(query)
    conn.commit()
    return template('views/addnew',
                    product_name=product_name,
					category=category)


@route('/static/<filename>')
def server_static(filename):
    return static_file(filename, root=settings.STATIC_ROUTE)


@route('/<cat>/static/<filename>')
def server_static(filename, cat):
    return static_file(filename, root=settings.STATIC_ROUTE)


@route('/about')
def show_about():
    return template('views/about')


@route('/')
def show_product_list():
    cursor = sqlite3.connect('main.db').cursor()
    cat_list = cursor.execute("SELECT DISTINCT cat FROM products ORDER BY name").fetchall()
    result_by_name = cursor.execute("SELECT *  FROM products ORDER BY name").fetchall()
    result_by_kcal = cursor.execute("SELECT *  FROM products ORDER BY cal DESC").fetchall()
    result_by_cat = cursor.execute("SELECT *  FROM products ORDER BY cat,name").fetchall()
    return template('views/main_page',
                    cat_list=cat_list,
                    result_by_name=result_by_name,
                    result_by_kcal=result_by_kcal,
                    result_by_cat=result_by_cat)


@route('/:category/:product')
def show_product_info(category, product):
    cursor = sqlite3.connect('main.db').cursor()
    result = cursor.execute("SELECT * FROM products WHERE name='%s'" % (product)).fetchall()
    if result:
        return template('views/product_info', rows=result, product=product)
    else:
        return('page not found')


@route('/:category')
def show_category(category):
    cursor = sqlite3.connect('main.db').cursor()
    result_by_name = cursor.execute("SELECT *  FROM products WHERE cat LIKE '%s' ORDER BY name" %(category+'%')).fetchall()
    result_by_kcal = cursor.execute("SELECT *  FROM products WHERE cat LIKE '%s' ORDER BY cal DESC" %(category+'%')).fetchall()
    if result_by_name:
        return template('views/show_cat',
                        result_by_name=result_by_name,
                        result_by_kcal=result_by_kcal,
                        category=category)
    else:
        return('page not found')


application = default_app()