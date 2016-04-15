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

    total = 500
    var1 = Random.rand(0 .. total)
    
    case message.text
    when "\/help"
      bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('./Images/help.jpg','image/jpg'), reply_to_message_id: message.message_id)
    when "\/help@JonasUfrgsBot"
      bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new('./Images/help.jpg','image/jpg'), reply_to_message_id: message.message_id)
    else
      case Random.rand(10) == 4
      when TRUE
        case var1
        when total - 1
          bot.api.send_message(chat_id: message.chat.id, text: "Bixa, a sra. é dextruidora mexmo!" )
        when total - 2
          bot.api.send_message(chat_id: message.chat.id, text: "Como se integra essa porra toda?")
        when total - 3
          bot.api.send_message(chat_id: message.chat.id, text: "Oxe!")
        when total - 4
          bot.api.send_message(chat_id: message.chat.id, text: "Se aprume menino")
        when total - 5
          bot.api.send_message(chat_id: message.chat.id, text: "Vou fazer cookies amanhã")
        when total - 6
          bot.api.send_message(chat_id: message.chat.id, text: "Oxe, nunca vi esse bixinho não.")
        when total - 7
          bot.api.send_message(chat_id: message.chat.id, text: "Veja lá o que cê vai fazer.")
        else

          if var1 <= 409
          then
            image = './Images/' + var1.to_s + '.jpg'
            bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(image,'image/jpg'))

          end
        end
      end
    end
  end
end

