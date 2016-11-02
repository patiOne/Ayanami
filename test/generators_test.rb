require 'ayanami/generators'
require 'test_helper'

# Test Cases for the generators used in Ayanami
# rubocop:disable Metrics/AbcSize
class GeneratorsTest < Minitest::Test
  def test_returned_types
    assert Ayanami::Generator.inline_keyboard_markup.is_a? Hash
    assert Ayanami::Generator.reply_keyboard_markup.is_a? Hash
    assert Ayanami::Generator.reply_keyboard_hide.is_a? Hash
    assert Ayanami::Generator.force_reply.is_a? Hash
    assert Ayanami::Generator.input_text_message_content.is_a? Hash
    assert Ayanami::Generator.input_location_message_content.is_a? Hash
    assert Ayanami::Generator.input_venue_message_content.is_a? Hash
    assert Ayanami::Generator.input_contact_message_content.is_a? Hash
    assert Ayanami::Generator.inline_keyboard_button.is_a? Hash
  end
end
