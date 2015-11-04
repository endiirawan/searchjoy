module Searchjoy
  module Track

    def search_with_track(term, options = {}, country_iso, language, city_id)
      results = search_without_track(term, options)

      if options[:track]
        attributes = options[:track] == true ? {} : options[:track]
        results.search = Searchjoy::Search.create({search_type: self.name, query: term, results_count: results.total_count, country_iso: country_iso, language: language, city_id: city_id}.merge(attributes))
      end

      results
    end

  end
end
