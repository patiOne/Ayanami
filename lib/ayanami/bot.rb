require 'rest_client'
require 'json'
require 'ayanami/hacks'

module Ayanami
  # Bot is an interface for a Telegram Bot
  # rubocop:disable Metrics/ClassLength
  class Bot
    def initialize(token)
      @token = token
    end

    def verify_arguments(**args)
      args.each do |k, v|
        raise ArgumentError, "#{k} can't be nil. nil values aren't allowed"\
          if v.nil?
      end
    end

    def request(method, **args)
      verify_arguments(args)
      res = RestClient.post("https://api.telegram.org/bot#{@token}/#{method}",
                            args)
      return JSON.parse(res)
    rescue RestClient::ExceptionWithResponse => err
      err.response
    end

    # Returns basic information about the bot
    # rubocop:disable Style/AccessorMethodName
    def get_me
      request('getMe')
    end

    # Receives incoming updates.
    def get_updates(**args)
      request('getUpdates', args)
    end

    # Sends a Message. On success, the sent Message is returned.
    def send_message(chat_id: nil, text: nil, **args)
      request('sendMessage', grab_arguments(__method__, binding))
    end

    # Forwards a message. On success, the sent Message is returned.
    def forward_message(chat_id: nil, from_chat_id: nil, message_id: nil,
                        **args)
      request('forwardMessage', grab_arguments(__method__, binding))
    end

    # Sends photos. On success, the sent Message is returned.
    def send_photo(chat_id: nil, photo: nil, **args)
      request('sendPhoto', grab_arguments(__method__, binding))
    end

    # Sends audio. On success, the sent Message is returned.
    def send_audio(chat_id: nil, audio: nil, **args)
      request('sendAudio', grab_arguments(__method__, binding))
    end

    # Sends documents. On success, the sent Message is returned.
    # Bots can currently send files of any type of up to 50 MB in size.
    def send_document(chat_id: nil, document: nil, **args)
      request('sendDocument', grab_arguments(__method__, binding))
    end

    # Sends stickers. On success, the sent Message is returned.
    def send_sticker(chat_id: nil, sticker: nil, **args)
      request('sendSticker', grab_arguments(__method__, binding))
    end

    # Sends videos. Telegram clients support mp4 videos (other formats may be
    # sent as Document). On success, the sent Message is returned.
    # Bots can currently send video files of up to 50 MB in size.
    def send_video(chat_id: nil, video: nil, **args)
      request('sendVideo', grab_arguments(__method__, binding))
    end

    # Sends voice messages. The audio format must be in an .ogg file encoded
    # with OPUS (other formats may be sent as Audio or Document).
    # On success, the sent Message is returned.
    # Bots can currently send voice messages of up to 50 MB in size.
    def send_voice(chat_id: nil, voice: nil, **args)
      request('sendVoice', grab_arguments(__method__, binding))
    end

    # Sends point on the map. On success, the sent Message is returned.
    def send_location(chat_id: nil, latitude: nil, longitude: nil, **args)
      request('sendLocation', grab_arguments(__method__, binding))
    end

    # Sends information about a venue. On success, the sent Message is returned.
    # rubocop:disable Metrics/ParameterLists
    def send_venue(chat_id: nil, latitude: nil, longitude: nil, title: nil,
                   address: nil, **args)
      request('sendVenue', grab_arguments(__method__, binding))
    end

    # Sends phone contacts. On success, the sent Message is returned.
    def send_contact(chat_id: nil, phone_number: nil, first_name: nil,
                     last_name: nil, **args)
      request('sendContact', grab_arguments(__method__, binding))
    end

    # Sends a status that tells something is happening. The status is set for
    # 5 seconds or less. Returns True on success.
    def send_chat_action(chat_id: nil, action: nil)
      request('sendChatAction', grab_arguments(__method__, binding))
    end

    # Returns a list of profile pictures for a user.
    def get_user_profile_photos(user_id: nil, **args)
      request('getUserProfilePhotos', grab_arguments(__method__, binding))
    end

    # Returns a basic info about a file and prepare it for downloading.
    # Bots can download files up to 20 MB in size.
    def get_file(file_id: nil)
      request('getFile', grab_arguments(__method__, binding))
    end

    # Kicks a chat member from a group/supergroup.
    def kick_chat_member(chat_id: nil, user_id: nil)
      request('kickChatMember', grab_arguments(__method__, binding))
    end

    # Leaves the group, supergroup, or channel.
    def leave_chat(chat_id: nil)
      request('leaveChat', grab_arguments(__method__, binding))
    end

    # Unbans previously kicked user in a supergroup.
    def unban_chat_member(chat_id: nil, user_id: nil)
      request('unbanChatMember', grab_arguments(__method__, binding))
    end

    # Returns information about the chat.
    def get_chat(chat_id: nil)
      request('getChat', grab_arguments(__method__, binding))
    end

    # Returns a list of administratos in a chat.
    def get_chat_administrators(chat_id: nil)
      request('getChatAdministrators', grab_arguments(__method__, binding))
    end

    # Returns the number of members in a chat.
    def get_chat_members_count(chat_id: nil)
      request('getChatMembersCount', grab_arguments(__method__, binding))
    end

    # Returns an information about a member of a chat.
    def get_chat_member(chat_id: nil, user_id: nil)
      request('getChatMember', grab_arguments(__method__, binding))
    end

    # Sends answers to callback queries sent from inline keyboards.
    def answer_callback_query(callback_query_id: nil, **args)
      request('answerCallbackQuery', grab_arguments(__method__, binding))
    end

    # Changes text and game messages sent by the bot or via the bot (for
    # inline bots).
    def edit_message_text(text: nil, **args)
      request('editMessageText', grab_arguments(__method__, binding))
    end

    # Changes captions of messages sent by the bot or via the bot (for
    # inline bots).
    def edit_message_caption(**args)
      request('editMessageCaption', args)
    end

    # Changes the markup of messages sent by the bot or via the bot (for
    # inline bots).
    def edit_message_reply_markup(**args)
      request('editMessageReplyMarkup', args)
    end

    # Answers to an inline query. On success, True is returned.
    def answer_inline_query(inline_query_id: nil, results: nil, **args)
      request('answerInlineQuery', grab_parameters(__method__, binding))
    end

    # Sends a game. On success, the sent Message is returned.
    def send_game(chat_id: nil, game_short_name: nil, **args)
      request('sendGame', grab_parameters(__method__, binding))
    end

    # Sets the score of the specified user in a game.
    # On success, if the message was sent by the bot, returns the edited
    # Message, otherwise returns True. Returns an error, if the new score is
    # not greater than the user's current score in the chat.
    def set_game_score(used_id: nil, score: nil, **args)
      request('setGameScore', grab_parameters(__method__, binding))
    end
  end
end
