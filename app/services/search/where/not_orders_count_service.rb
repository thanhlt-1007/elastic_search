class Search::Where::NotOrdersCountService < Search::ApplicationService
  attr_reader :orders_count

  def initialize key_word, options = {}
    super
    @orders_count = options[:orders_count]
  end

  private

  def where
    {
      _not: {orders_count: orders_count}
    }
  end

  def search_info
    products = results.to_a

    puts "\nKeyword #{key_word}\n"
    puts "\nFound #{results.total_count} result(s) in #{results.took} ms\n"

    index_header = "NO".ljust(5)
    id_header = "ID".ljust(5)
    name_header = "NAME".ljust(40)
    store_id_header = "STORE ID".center(10, " ")
    orders_count_header = "ORDERS COUNT".center(15, " ")

    puts "\n|#{index_header}|#{id_header}|#{name_header}|#{store_id_header}|#{orders_count_header}|"

    puts "".center(81, "-")

    products.each.with_index(1) do |product, index|
      index = index.to_s.ljust(5)
      id = product.id.to_s.ljust(5)
      name = product.name.ljust(40)
      store_id = product.store_id.to_s.center(10, " ")
      orders_count = product.orders_count.to_s.center(15, " ")

      puts "|#{index}|#{id}|#{name}|#{store_id}|#{orders_count}|"
    end

    puts "END".center(81, "-")
  end
end
