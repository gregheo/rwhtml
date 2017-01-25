#!/usr/bin/env ruby

# rwhtml - a peculiar markdown-to-HTML converter
# For more information, visit https://github.com/gregheo/rwhtml

begin
  require 'redcarpet'
rescue LoadError
  puts "Redcarpet was not found!"
  puts "Install it with `gem install redcarpet` and try again."
  exit
end

module Redcarpet
  module Render
    class RWHTML < HTML

      ### block elements ###

      def header(text, level)
        "<h#{level}>#{text}</h#{level}>\n\n"
      end

      def paragraph(text)
        # skip codex format tags
        return if text =~ /^\$\[.*\]/

        "#{text.strip}\n\n"
      end

      def block_code(code, language)
        # special handling for codex preamble
        if language == 'metadata'
          return "<!-- codex metadata\n#{code}-->\n\n"
        end

        "<pre lang=\"#{language}\">\n#{code}</pre>\n\n"
      end

      def block_quote(text)
        "<div class=\"note\">#{text.strip}</div>\n\n"
      end

      ### formatting ###

      def normal_text(text)
        text
      end

      def codespan(text)
        "<code>#{text}</code>"
      end

      def emphasis(text)
        "<i>#{text}</i>"
      end

      def double_emphasis(text)
        "<em>#{text}</em>"
      end

      ### special things ###
      def image(link, title, content)
        "[[TODO: image #{link} #{title} #{content}]]"
      end

    end
  end
end

renderer = Redcarpet::Render::RWHTML.new(escape_html: false)
markdown = Redcarpet::Markdown.new(renderer,
  no_intra_emphasis: false, fenced_code_blocks: true, strikethrough: true,
  tables: true)
STDOUT.write markdown.render(ARGF.read)

