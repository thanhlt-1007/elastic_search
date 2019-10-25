class Search::Where::AllWithArrayService < Search::ApplicationService
  attr_reader :order_ids

  def initialize key_word, options = {}
    super
    @order_ids = options[:order_ids]
  end

  private

  def where
    {
      order_ids: {all: order_ids}
    }
  end

  def search_info
    products = results.to_a

    puts "\nKeyword #{key_word}\n"
    puts "\nFound #{results.total_count} result(s) in #{results.took} ms\n"

    index_header = "NO".ljust(5)
    id_header = "ID".ljust(5)
    name_header = "NAME".ljust(40)
    order_ids_header = "ORDER IDS".center(40, " ")

    puts "\n|#{index_header}|#{id_header}|#{name_header}|#{order_ids_header}|"

    puts "".center(95, "-")

    products.each.with_index(1) do |product, index|
      index = index.to_s.ljust(5)
      id = product.id.to_s.ljust(5)
      name = product.name.ljust(40)
      order_ids = product.order_ids.to_s.center(40, " ")

      puts "|#{index}|#{id}|#{name}|#{order_ids}|"
    end

    puts "END".center(95, "-")
  end
end
