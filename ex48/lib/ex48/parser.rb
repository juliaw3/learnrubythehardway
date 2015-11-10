class ParserError < Exception
end

class Sentence

  def initialize(subject, verb, number, object)

    @subject = subject[1]
    @verb = verb[1]
    @number = number[1]
    @object = object[1]
  end

  attr_reader :subject
  attr_reader :verb
  attr_reader :object, :number
end

class Parser

  def self.peek(word_list)
    if word_list
      word = word_list[0]
      return word[0]
    else
      return nil
    end
  end

  def self.match(word_list, expecting)
    if word_list
      word = word_list.shift

      if word[0] == expecting
        return word
      else
        return nil
      end
    else
      return nil
    end
  end

  def self.skip(word_list, word_type)
    while Parser.peek(word_list) == word_type
      Parser.match(word_list, word_type)
    end
  end


  def self.parse_number(word_list)
    Parser.skip(word_list, 'stop')

    if Parser.peek(word_list) == 'number'
      return Parser.match(word_list, 'number')
    else
      return ['number', 1]
    end
  end

  def self.parse_verb(word_list)

    
    Parser.skip(word_list, 'stop')
 
    if Parser.peek(word_list) == 'verb'
      return Parser.match(word_list, 'verb')
 
    else
      raise ParserError.new("Expected a verb next.")
    end
  end


  def self.parse_object(word_list)
    Parser.skip(word_list, 'stop')
    next_word = Parser.peek(word_list)

    if next_word == 'noun'
      return match(word_list, 'noun')
    elsif next_word == 'direction'
      return match(word_list, 'direction')
    else
      raise ParserError.new("Expected a noun or direction next.")
    end
  end


  def self.parse_subject(word_list)
    Parser.skip(word_list, 'stop')
    next_word = Parser.peek(word_list)

    if next_word == 'noun'
      return Parser.match(word_list, 'noun')
  
    elsif next_word == 'verb'
      return ['noun', 'player']
    else
      raise ParserError.new("Expected a verb next.")
    end
  end

  def self.parse_sentence(word_list)
    subject = Parser.parse_subject(word_list)
    verb = Parser.parse_verb(word_list)
    number = Parser.parse_number(word_list)
    object = Parser.parse_object(word_list)

    return Sentence.new(subject, verb, number, object)
  end
end