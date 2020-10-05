RSpec::Matchers.define :have_content_type do |expected|
  def content_type(type)
    types = {
        html: 'text/html; charset=utf-8',
        json: 'application/json; charset=utf-8'
    }
    types[type.to_sym] || 'unknown content type'
  end

  match do |actual|
    begin
      actual.content_type == content_type(expected)
    rescue ArgumentError
      false
    end
  end

  failure_message do |actual|
    "Expected #{content_type(actual.content_type)} to be #{content_type(expected)}"
  end

  failure_message_when_negated do |actual|
    "Expected #{content_type(actual.content_type)} not to be #{content_type(expected)}"
  end
end

RSpec::Matchers.alias_matcher :be_content_type, :have_content_type