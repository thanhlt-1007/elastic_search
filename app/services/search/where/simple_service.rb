class Search::Where::SimpleService < Search::ApplicationService
  attr_reader :in_stock

  def initialize key_word, options = {}
    super
    @in_stock = options[:in_stock]
  end

  private

  def where
    {in_stock: in_stock}
  end

  def search_info
    products = results.to_a

    puts "\nKeyword #{key_word}\n"
    puts "\nFound #{results.total_count} result(s) in #{results.took} ms\n"

    index_header = "NO".ljust(5)
    id_header = "ID".ljust(5)
    name_header = "NAME".ljust(40)
    in_stock_header = "IN STOCK".ljust(10)

    puts "\n|#{index_header}|#{id_header}|#{name_header}|#{in_stock_header}|"

    puts "".center(65, "-")

    products.each.with_index(1) do |product, index|
      index = index.to_s.ljust(5)
      id = product.id.to_s.ljust(5)
      name = product.name.ljust(40)
      in_stock = product.in_stock.to_s.center(10, " ")

      puts "|#{index}|#{id}|#{name}|#{in_stock}|"
    end

    puts "END".center(65, "-")
  end
end
