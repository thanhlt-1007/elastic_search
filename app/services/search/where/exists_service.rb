class Search::Where::ExistsService < Search::ApplicationService
  attr_reader :store_exists

  def initialize key_word, options = {}
    super
    @store_exists = options[:store_exists]
    puts "store_exists: #{store_exists}"
  end

  private

  def where
    store_exists ? where_exists : where_not_exists
  end

  def where_exists
    {
      store_id: {exists: true}
    }
  end

  def where_not_exists
    {
      store_id: nil
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

    puts "\n|#{index_header}|#{id_header}|#{name_header}|#{store_id_header}|"

    puts "".center(65, "-")

    products.each.with_index(1) do |product, index|
      index = index.to_s.ljust(5)
      id = product.id.to_s.ljust(5)
      name = product.name.ljust(40)
      store_id = product.store_id.to_s.center(10, " ")

      puts "|#{index}|#{id}|#{name}|#{store_id}|"
    end

    puts "END".center(65, "-")
  end
end
