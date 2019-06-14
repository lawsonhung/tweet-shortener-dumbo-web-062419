# Write your code here.
# binding.pry
require 'pry'

# #dictionary contains the words-to-be-substituted and their substitutes
def dictionary
    dictionary = {
        hello: "hi",
        to: "2",
        two: "2",
        too: "2",
        for: "4",
        four: "4",
        be: "b",
        you: "u",
        at: "@",
        and: "&"
    }
end

# Invoking #dictionary below to test
# puts dictionary

# Takes a string of a tweet and shortens the string based on the substitutes in #dictionary
def word_substituter(tweet)

    # Splits up the tweet with the space " " delimiter into an array of words
    tweet_array = tweet.split(" ")
    # local_dictionary stores a copy of the dictionary in a variable within this method to be operated upon
    local_dictionary = dictionary
    # tweet_index is used to iterate through the tweet_array with #each_with_index
    tweet_index = 0
    # shortened_tweet is the return value of this method
    shortened_tweet = ""


    # Iterates through tweet_array
    tweet_array.each_with_index do |tweet_word, tweet_index|

        # Iterates through local_dictionary hash
        local_dictionary.each do |dictionary_key, dictionary_value|
            # Converts each dictionary key to a string to be compared to tweet_word
            # Converts each tweet_word in all lowercase letters for consistency
            # If tweet_word is equal to dictionary_key, replace it with the corresponding value
            if dictionary_key.to_s == tweet_word.downcase
                tweet_array[tweet_index] = dictionary_value
            end
        end # Iterates through local_dictionary hash

        # Increment tweet_index
        tweet_index += 1
    end # Iterates through tweet_array

    # Joins tweet_array back into a string
    shortened_tweet = tweet_array.join(" ")

    ####################### Testing returns below
    # tweet_array
    # binding.pry
    # Return value of this method is string shortened_tweet
    shortened_tweet
end

# Takes in an array of tweets, iterates over them, shortens them, and puts out the results
def bulk_tweet_shortener(tweet_arrays)
    # shortened_tweets stores the return value of this method, an array of strings of shortened tweets
    shortened_tweets = []

    # Iterates through tweet_arrays and shortens each tweet
    tweet_arrays.each do |tweet|
        shortened_tweets << word_substituter(tweet)
    end

    # Iterates through shortened_tweets and puts out each shortened_tweet
    shortened_tweets.each do |shortened_tweet|
        puts shortened_tweet
    end

    ####################### Testing below
    # binding.pry
end

# Accepts an argument of a tweet string
# Only invokes #word_substituter if the tweet is longer than 140 characters
def selective_tweet_shortener(tweet)
    # Checks to see if the tweet is longer than 140 characters
    if tweet.length > 140
        return word_substituter(tweet)
    # If the tweet is 140 characters or less, return the original tweet as is
    else
        return tweet
    end # Checks to see if the tweet is longer than 140 characters
end

# Accepts an argument of a tweet string
# Truncates the tweet to 140 characters with an ellipsis (...) if it's still too long after substitution
def shortened_tweet_truncator(tweet)
    # shortened_tweet stores the new shortened tweet to be returned for this method
    # Instantiated with the shortened tweet using #word_substituter
    shortened_tweet = word_substituter(tweet)

    # Checks to see if the length of shortened_tweet is longer than 140 characters
    # If true, truncates the tweet to 140 characters with an ellipsis (...). The ellipsis is included in the count
    if shortened_tweet.length > 140
        shortened_tweet = shortened_tweet[0..136]
        shortened_tweet << "..."
    end

    # Returns the shortened tweet
    shortened_tweet
end

