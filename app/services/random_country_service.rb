class RandomCountryService

  def self.random_search
    response = conn.get('/v3.1/all?fields=name')
    countries = JSON.parse(response.body, symbolize_names: true)
    countries.map { |country| country[:name][:common] }.sample
  end

  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end
end
