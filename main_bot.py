# -*- coding: utf-8 -*-
import telebot
import settings
import sqlite3


def db_exec(message):  # функция соединяется с базой и цепляет из нее данные по введенному продукту
    try:
        conn = sqlite3.connect('main.db')
        cursor = conn.cursor()
        exec_result = cursor.execute("SELECT * FROM products where name ='%s'" % (message.text)).fetchall()
        rep_mes = '''На 100 грамм:
        Белки: ''' + str(exec_result[0][1]) + '''
        Жиры: ''' + str(exec_result[0][2]) + '''
        Углеводы: ''' + str(exec_result[0][3]) + '''
        Калорийность: ''' + str(exec_result[0][4])
        return rep_mes
    except IndexError:
        return 'Нет результатов'
    except sqlite3.OperationalError:
        return 'Ошибка: Нет связи с базой данных'


bot = telebot.TeleBot(settings.BOT_TOKEN)


@bot.message_handler(commands=['start'])
def send_welcome(message):
    bot.reply_to(message, '''\
Привет! Это бот с информацией о пищевой ценности продуктов Calorit bot.
Чтобы найти нужный продукт, введи его название:
''')

@bot.message_handler(func=lambda message: True)
def show_product_info(message):
    bot.reply_to(message, db_exec(message))


bot.polling()