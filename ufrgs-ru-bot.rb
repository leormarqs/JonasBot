#!/usr/bin/env ruby

require 'rubygems'
require 'bundler/setup'
require 'telegram/bot'
require 'nokogiri'
require 'rest-client'

token = File.read('token.txt').strip

def getMenu(n)
  url = "http://www.ufrgs.br/ufrgs/ru"
  selector = "#ru#{n} > div:nth-child(2)"
  html = Nokogiri.HTML(RestClient.get(url))
  textDiv = html.css(selector)
  textDiv.css("br").each { |n| n.replace("\n") }
  text = textDiv.text

  if text.empty?
    "Não tem RU hoje :-(\n http://www.ufrgs.br/ufrgs/ru"
  else
    text
  end
rescue => e
  "deu pau! #{e}\n#{e.backtrace}"
end

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/ru1'
      bot.api.send_message(chat_id: message.chat.id, text: " #{getMenu(1)}")
    when '/ru2'
      bot.api.send_message(chat_id: message.chat.id, text: " #{getMenu(2)}")
    when '/ru3'
      bot.api.send_message(chat_id: message.chat.id, text: " #{getMenu(3)}")
    when '/ru4'
      bot.api.send_message(chat_id: message.chat.id, text: " #{getMenu(4)}")
    when '/ru5'
      bot.api.send_message(chat_id: message.chat.id, text: " #{getMenu(5)}")
    when '/ru6'
      bot.api.send_message(chat_id: message.chat.id, text: " #{getMenu(6)}")
    else
      bot.api.send_message(chat_id: message.chat.id, text: "/ru1, /ru2, ... /ru6 para ver o menu do RU")
    end
  end
end

