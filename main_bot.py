import telebot
import settings
import sqlite3


def dbconnect():
    conn = sqlite3.connect('main.db')
    cursor = conn.cursor()

bot = telebot.TeleBot(settings.BOT_TOKEN)

@bot.message_handler(commands=['start', 'about'])
def send_welcome(message):
    bot.reply_to(message, "Привет! Это бот с информацией о пищевой ценности продуктов Calorit.")

@bot.message_handler(func=lambda message: True)
def echo_all(message):
    bot.reply_to(message, message.text)

bot.polling()