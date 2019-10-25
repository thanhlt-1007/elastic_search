class Search::AllService < Search::ApplicationService
  def initialize
    puts "INITIALIZING Search::AllService".bold.green
    @key_word = "*"
  end
end
