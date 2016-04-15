#!/usr/bin/env ruby
# coding: utf-8

require 'rubygems'
require 'bundler/setup'
require 'telegram/bot'
require 'nokogiri'
require 'rest-client'
require 'faraday'

token = File.read('token.txt').strip


Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    total = 100
    var1 = Random.rand(total)
    case var1
    when total
      bot.api.send_message(chat_id: message.chat.id, text: "Bixa, a sra. é dextruidora mexmo!" )
    when total - 1
      bot.api.send_message(chat_id: message.chat.id, text: "Como se integra essa porra toda?")
    when total - 2
      bot.api.send_message(chat_id: message.chat.id, text: "Oxe!")
    when total - 3
      bot.api.send_message(chat_id: message.chat.id, text: "Se aprume menino")
    when total - 4
      bot.api.send_message(chat_id: message.chat.id, text: "Vou fazer cookies amanhã")
    when total - 5
      bot.api.send_message(chat_id: message.chat.id, text: "Oxe, nunca vi esse bixinho não.")
    when total - 6
      bot.api.send_message(chat_id: message.chat.id, text: "Veja lá o que cê vai fazer.")
    else
      if var1 < 35
      then
        image = './Images/' + var1.to_s + '.jpg'
        bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(image, 'image/jpeg'))
      end
    end
  end
end

