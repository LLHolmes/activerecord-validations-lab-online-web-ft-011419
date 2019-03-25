class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    clickbait = [/Won't Believe/i, /Secret/i, /Guess/i, /Top [\d]*/i]
    # binding.pry

    # clickbait.none? { |bait| bait.match(value) }

    if value && clickbait.none? { |bait| bait.match(value) }
      record.errors.add(attribute, "needs to be more Clickbait-y")
    end
  end
end
