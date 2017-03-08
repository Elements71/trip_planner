namespace :countries do
  desc 'create a table with all countries'
  task :create_countries => :environment do
    response = RestClient.get('https://restcountries.eu/rest/v2/all')
    json = JSON.parse(response.body)
    json.each do |country|
      Country.create(name: country["name"],
                     continent: country["region"]
                  )
    end
  end

  desc 'create a table with all cities'
  task :create_cities => :environment do
    response = RestClient.get("https://raw.githubusercontent.com/David-Haim/CountriesToCitiesJSON/master/countriesToCities.json")
    json = JSON.parse(response.body)
      Country.all.each do |country|
        next unless cities = json[country.name]
        cities.each do |city|
          City.create(name: city, country_id: country.id)
        end
      end
  end
end