require 'rest_client'
require 'json'

module Ayanami
  # Bot is an interface for a Telegram Bot
  # rubocop:disable Metrics/ClassLength
  class Bot
    def initialize(token)
      @token = token
    end

    def verify_arguments(**args)
      args.each do |k, v|
        throw "#{k} can't be nil. Nil variables aren't allowed" if v.nil?
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
    def send_message(**args)
      request('sendMessage', args)
    end

    # Forwards a message. On success, the sent Message is returned.
    def forward_message(**args)
      request('forwardMessage', args)
    end

    # Sends photos. On success, the sent Message is returned.
    def send_photo(**args)
      request('sendPhoto', args)
    end

    # Sends audio. On success, the sent Message is returned.
    def send_audio(**args)
      request('sendAudio', args)
    end

    # Sends documents. On success, the sent Message is returned.
    # Bots can currently send files of any type of up to 50 MB in size.
    def send_document(**args)
      request('sendDocument', args)
    end

    # Sends stickers. On success, the sent Message is returned.
    def send_sticker(**args)
      request('sendSticker', args)
    end

    # Sends videos. Telegram clients support mp4 videos (other formats may be
    # sent as Document). On success, the sent Message is returned.
    # Bots can currently send video files of up to 50 MB in size.
    def send_video(**args)
      request('sendVideo', args)
    end

    # Sends voice messages. The audio format must be in an .ogg file encoded
    # with OPUS (other formats may be sent as Audio or Document).
    # On success, the sent Message is returned.
    # Bots can currently send voice messages of up to 50 MB in size.
    def send_voice(**args)
      request('sendVoice', args)
    end

    # Sends point on the map. On success, the sent Message is returned.
    def send_location(**args)
      request('sendLocation', args)
    end

    # Sends information about a venue. On success, the sent Message is returned.
    def send_venue(**args)
      request('sendVenue', args)
    end

    # Sends phone contacts. On success, the sent Message is returned.
    def send_contact(**args)
      request('sendContact', args)
    end

    # Sends a status that tells something is happening. The status is set for
    # 5 seconds or less. Returns True on success.
    def send_chat_action(**args)
      request('sendChatAction', args)
    end

    # Returns a list of profile pictures for a user.
    def get_user_profile_photos(**args)
      request('getUserProfilePhotos', args)
    end

    # Returns a basic info about a file and prepare it for downloading.
    # Bots can download files up to 20 MB in size.
    def get_file(**args)
      request('getFile', args)
    end

    # Kicks a chat member from a group/supergroup.
    def kick_chat_member(**args)
      request('kickChatMember', args)
    end

    # Leaves the group, supergroup, or channel.
    def leave_chat(**args)
      request('leaveChat', args)
    end

    # Unbans previously kicked user in a supergroup.
    def unban_chat_member(**args)
      request('unbanChatMember', args)
    end

    # Returns information about the chat.
    def get_chat(**args)
      request('getChat', args)
    end

    # Returns a list of administratos in a chat.
    def get_chat_administrators(**args)
      request('getChatAdministrators', args)
    end

    # Returns the number of members in a chat.
    def get_chat_members_count(**args)
      request('getChatMembersCount', args)
    end

    # Returns an information about a member of a chat.
    def get_chat_member(**args)
      request('getChatMember', args)
    end

    # Sends answers to callback queries sent from inline keyboards.
    def answer_callback_query(**args)
      request('answerCallbackQuery', args)
    end

    # Changes text and game messages sent by the bot or via the bot (for
    # inline bots).
    def edit_message_text(**args)
      request('editMessageText', args)
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
    def answer_inline_query(**args)
      request('answer_inline_query', args)
    end

    # Sends a game. On success, the sent Message is returned.
    def send_game(**args)
      request('sendGame', args)
    end

    # Sets the score of the specified user in a game.
    # On success, if the message was sent by the bot, returns the edited
    # Message, otherwise returns True. Returns an error, if the new score is
    # not greater than the user's current score in the chat.
    def set_game_score(**args)
      request('setGameScore', args)
    end
  end
end
