# frozen_string_literal: true

class HeadingsUtil
  class << self
    require 'open-uri'
    def save_headings(member)
      document = Nokogiri::HTML.parse(open(member.personal_website))
      (1..3).each do |i|
        headings = extract_headings(document, "h#{i}")
        insert_headings_db(member, headings)
      end
    end

    def insert_headings_db(member, headings)
      headings.each do |heading|
        h = Heading.new
        h.member = member
        h.topic = heading
        h.save
      end
    end

    def extract_headings(document, heading_level)
      formatted_headings = []
      headings = document.css(heading_level)
      return nil if headings.blank?

      headings.each do |heading|
        formatted_headings.append(heading.text)
      end
      formatted_headings
    end
  end
end
