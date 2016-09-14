from bottle import route, run, template, static_file
import sqlite3


def show_product_list():
    cursor = sqlite3.connect('main.db').cursor()
    result=cursor.execute("SELECT name FROM products").fetchall()
    return template('views/main_page', rows=result)


def show_product_info(product):
    cursor = sqlite3.connect('main.db').cursor()
    result=cursor.execute("SELECT CAL, j, b, u FROM products WHERE name='%s'" % (product)).fetchall()
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