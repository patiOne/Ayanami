require 'ayanami/hacks'

module Ayanami
  # Generator contains Telegram objects that are used as arguments
  module Generator
    def self.inline_keyboard_markup(inline_keyboard: [])
      __grab_parameters(__method__, binding)
    end

    def self.reply_keyboard_markup(keyboard: [[]], **args)
      __grab_parameters(__method__, binding)
    end

    def self.reply_keyboard_hide(hide_keyboard: true, **args)
      __grab_parameters(__method__, binding)
    end

    def self.force_reply(force_reply: true, **args)
      __grab_parameters(__method__, binding)
    end

    def self.input_text_message_content(message_text: nil, **args)
      __grab_parameters(__method__, binding)
    end

    def self.input_location_message_content(latitude: nil, longitude: nil)
      __grab_parameters(__method__, binding)
    end

    def self.input_venue_message_content(latitude: nil, longitude: nil,
                                         title: nil, address: nil, **args)
      __grab_parameters(__method__, binding)
    end

    def self.input_contact_message_content(phone_number: nil, first_name: nil,
                                           **args)
      __grab_parameters(__method__, binding)
    end

    def self.inline_keyboard_button(text: nil, **args)
      __grab_parameters(__method__, binding)
    end

    def self.keyboard_button(text: nil, **args)
      __grab_parameters(__method__, binding)
    end
  end
end
