# frozen_string_literal: true

require_relative 'hexlet_code/version'

# Simple Form Builder
module HexletCode
  class Error < StandardError; end
  # Your code goes here...

  # Build html tag
  class Tag
    def self.build(tag, html_options = {}, &block)
      options = html_options.any? ? html_options.map { |key, value| " #{key}=\"#{value}\"" } : ['']

      is_pair_tag = block_given?

      open_tag = "<#{tag}#{options.join('')}>"
      content = yield block if is_pair_tag
      closing_tag = "</#{tag}>"

      is_pair_tag ? "#{open_tag}#{content}#{closing_tag}" : open_tag
    end
  end
end
