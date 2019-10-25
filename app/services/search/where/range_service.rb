class Search::Where::RangeService < Search::ApplicationService
  attr_reader :gte, :lte

  def initialize key_word, options = {}
    super
    @gte = options[:gte]
    @lte = options[:lte]
  end

  private

  def where
    {
      orders_count: {gte: gte, lte: lte}
    }
  end

  def search_info
    products = results.to_a

    puts "\nKeyword #{key_word}\n"
    puts "\nFound #{results.total_count} result(s) in #{results.took} ms\n"

    index_header = "NO".ljust(5)
    id_header = "ID".ljust(5)
    name_header = "NAME".ljust(40)
    orders_count_header = "ORDERS COUNT".center(15, " ")

    puts "\n|#{index_header}|#{id_header}|#{name_header}|#{orders_count_header}|"

    puts "".center(70, "-")

    products.each.with_index(1) do |product, index|
      index = index.to_s.ljust(5)
      id = product.id.to_s.ljust(5)
      name = product.name.ljust(40)
      orders_count = product.orders_count.to_s.center(15, " ")

      puts "|#{index}|#{id}|#{name}|#{orders_count}|"
    end

    puts "END".center(70, "-")
  end
end
