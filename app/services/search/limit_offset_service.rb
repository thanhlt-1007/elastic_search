class Search::LimitOffsetService < Search::ApplicationService
  attr_reader :limit, :offset

  def initialize key_word, options = {}
    super
    @limit = options[:limit]
    @offset = options[:offset]
  end

  def perform
    puts "\nSearching by #{self.class.to_s}\n".green

    @results = Product.search key_word, limit: limit, offset: offset
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
    description_header = "DESCRIPTION".ljust(60)

    puts "\n|#{index_header}|#{id_header}|#{name_header}|#{description_header}"

    puts "".center(115, "-")

    products.each.with_index(1) do |product, index|
      index = index.to_s.ljust(5)
      id = product.id.to_s.ljust(5)
      name = product.name.ljust(40)
      description = product.description.ljust(60)

      puts "|#{index}|#{id}|#{name}|#{description}|"
    end

    puts "END".center(115, "-")
  end
end
