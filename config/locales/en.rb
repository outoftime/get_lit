{
  :en => {
    :searches => {
      :show => {
        :header => proc { |key, interpolations|
          book, drink = interpolations[:book], interpolations[:drink]
          article = book =~ /^aeiou/i ? 'an' : 'a'
          "You're reading #{book}. How about sipping on #{article} #{drink}?"
        }
      }
    }
  }
}
