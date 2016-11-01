require 'ayanami/hacks'
require 'test_helper'

# Implementation of Test method
module Ayanami
  def self.gimme(a = 1, b: 2, **args)
    grab_parameters(__method__, binding)
  end
end

# Test Cases for the hacks used in Ayanami
# rubocop:disable Metrics/AbcSize
class HacksTest < Minitest::Test

  def test_grab_parameters_basic
    assert Ayanami.gimme.is_a? Hash
    assert Ayanami.gimme(2).is_a? Hash
    assert Ayanami.gimme(b: 5).is_a? Hash
    assert Ayanami.gimme(b: 5, c: { d: 4 }).is_a? Hash
  end

  def test_grab_parameters_count
    assert_equal Ayanami.gimme.size, 2
    assert_equal Ayanami.gimme(5).size, 2
    assert_equal Ayanami.gimme(b: 5).size, 2
    assert_equal Ayanami.gimme(a: 2, b: 6).size, 2
    assert_equal Ayanami.gimme(c: 3).size, 3
    assert_equal Ayanami.gimme(c: 3, d: 4).size, 4
    assert_equal Ayanami.gimme(a: 2, c: 5).size, 3
  end

  def test_grab_parameters_invalid
    assert Ayanami.gimme(asuka: 5, ayanami: 3)[:args].nil?
    assert Ayanami.gimme(alpha: 2).select { |_, v| v.is_a? Hash }.empty?
  end

  def test_grab_parameters_valid
    val = Ayanami.gimme(i: 'cool', j: 1, k: { hail: true })

    assert val[:i].is_a? String
    assert val[:j].is_a? Integer
    assert val[:k].is_a? Hash

    assert_equal val[:i], 'cool'
    assert_equal val[:j], 1
    assert val[:k][:hail]
  end
end
