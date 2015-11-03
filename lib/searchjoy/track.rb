module Searchjoy
  module Track

    def search_with_track(term, options = {}, country, language, city)
      results = search_without_track(term, options)

      if options[:track]
        attributes = options[:track] == true ? {} : options[:track]
        results.search = Searchjoy::Search.create({search_type: self.name, query: term, results_count: results.total_count, country: country, language: language, city: city}.merge(attributes))
      end

      results
    end

  end
end
