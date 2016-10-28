# -*- coding: utf-8 -*-
import telebot
import settings
import sqlite3
from telebot import types


def db_exec(message):  # функция соединяется с базой и возвращает из нее данные по продукту
    message.text = message.text.capitalize() # приводим введенное слово к нормальнму регистру аля "Ананас"
    try:
        conn = sqlite3.connect('main.db')
        cursor = conn.cursor()
        exec_result = cursor.execute("SELECT * FROM products where name ='%s'" % (message.text)).fetchall()
        rep_mes = '''Продукт "''' + str(exec_result[0][0]) + '''", на 100 грамм:
        Белки: ''' + str(exec_result[0][1]) + '''
        Жиры: ''' + str(exec_result[0][2]) + '''
        Углеводы: ''' + str(exec_result[0][3]) + '''
        Калорийность: ''' + str(exec_result[0][4])
        return rep_mes
    except IndexError:
        return 'Нет результатов'
    except sqlite3.OperationalError:
        return 'Ошибка: Нет связи с базой данных'


def get_cat_names():  # функция возвращает список наименований категорий из таблицы category
    n = ''
    try:
        conn = sqlite3.connect('main.db')
        cursor = conn.cursor()
        exec_result = cursor.execute("SELECT DISTINCT cat FROM products").fetchall()
        for i in exec_result:
            i = i[0]
            n = n+i[0:-1]+';'
        n = n.split(';')
        n = n[:-1]
        return n
    except sqlite3.OperationalError:
        return 'Ошибка: Нет связи с базой данных'


bot = telebot.TeleBot(settings.BOT_TOKEN)


@bot.message_handler(commands=['start','help'])
def send_welcome(message):
    bot.reply_to(message, '''\
Привет!

Это бот с информацией о пищевой ценности продуктов CaloritBot.

Чтобы найти нужный продукт, введи его название, например, "Ананас", или воспользуйся кнопочным поиском.

Полный перечень продуктов - на сайте http://calorit.ru
''')
    markup = types.ReplyKeyboardMarkup()
    #bot.send_message(message.chat.id, "Выбери категорию продукта:", reply_markup=markup)


@bot.message_handler(func=lambda message: True)
def show_product_info(message):
    bot.reply_to(message, db_exec(message))
    #bot.reply_to(message, get_cat_names())
    #print(get_cat_names())


bot.polling(none_stop=True, interval=0)