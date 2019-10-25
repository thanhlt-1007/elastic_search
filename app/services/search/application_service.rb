class Search::ApplicationService
  attr_reader :key_word, :results

  def initialize key_word
    puts "\nINITIALIZING #{self.class.to_s}\n".bold.green
    @key_word = key_word
  end

  def perform
    puts "\nSearching by #{self.class.to_s}\n".green
    @results = Product.search key_word
    search_info
  end

  private

  def search_info
    products = results.to_a

    puts "\nKeyword #{key_word}\n"
    puts "\nFound #{results.total_count} result(s) in #{results.took} ms\n"

    index_header = "NO".ljust(5)
    id_header = "ID".ljust(5)
    name_header = "NAME".ljust(40)
    puts "\n|#{index_header}|#{id_header}|#{name_header}|"

    puts "".center(54, "-")

    products.each.with_index(1) do |result, index|
      index = index.to_s.ljust(5)
      id = result.id.to_s.ljust(5)
      name = result.name.ljust(40)
      puts "|#{index}|#{id}|#{name}|"
    end

    puts "END".center(54, "-")
  end
end
