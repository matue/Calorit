from bottle import route, run, template, static_file
import sqlite3


def show_product_list():
    cursor = sqlite3.connect('main.db').cursor()
    result_by_name=cursor.execute("SELECT *  FROM products ORDER BY name").fetchall()
    result_by_kcal = cursor.execute("SELECT *  FROM products ORDER BY cal DESC").fetchall()
    result_by_cat = cursor.execute("SELECT *  FROM products ORDER BY cat,name").fetchall()
    return template('views/main_page',
                    result_by_name=result_by_name,
                    result_by_kcal=result_by_kcal,
                    result_by_cat=result_by_cat)


def show_product_info(product):
    cursor = sqlite3.connect('main.db').cursor()
    result=cursor.execute("SELECT * FROM products WHERE name='%s'" % (product)).fetchall()
    if result:
        return template('views/product_info', rows=result, product=product)
    else:
        return('page not found')


@route('/')
def show_main():
    return show_product_list()

@route('/:product')
def show_product(product):
    return show_product_info(product)

@route('/static/<filename>')
def server_static(filename):
    return static_file(filename,
                       root='C:/Users/Никита/PycharmProjects/calori/static')

run(host='localhost', port=80, reloader=True)