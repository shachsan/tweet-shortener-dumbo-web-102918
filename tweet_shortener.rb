##Word substituting factory
def dictionary(word)
  replace_dics = {
    "hello"=>'hi',
    "to"=>'2',
    "two"=>'2',
    "too"=>'2',
    "for"=>'4',
    "four"=>'4',
    'be'=>'b',
    'you'=>'u',
    "at"=>"@",
    "and"=>"&"
  }

  replace_dics.each do |words_to_be_substituted, substitute|
    if word.downcase == words_to_be_substituted
      return substitute
    end
  end
  return word
end

##Helper method to send each word to dictionary method to
##check if any replacement is necessary
def shorten(tweet)
  tweet.split.map {|word|dictionary(word)}.join( " ")
end

##truncate tweets as directed
def truncate(tweet)
  return tweet[0..36]+ "..."
end

#replaces long words with their expected short form
def word_substituter(string)
  shorten(string)
end

#shortens each tweet and prints the results
def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
    puts shorten(tweet)
  end
end

##shortens tweets that are more than 140 characters
##does not shorten tweets that are less than 130 characters
def selective_tweet_shortener(tweet)
  length = tweet.length
  if length > 140
    shorten(tweet)
  elsif length < 130
    return tweet
  end
end


## does not shorten tweets shorter than 140 characters.
def shortened_tweet_truncator(tweet)
  shorten_tweet = ""
  if tweet.length > 140
    shorten_tweet = shorten(tweet)
  end

  if shorten_tweet > 140
    return truncate(tweet)
  else
    return shorten_tweet
  end

end
