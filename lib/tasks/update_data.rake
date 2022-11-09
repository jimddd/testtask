namespace :update_data do
  desc "Parse the Google Sheets and save the data into the DB"
  task parse_google_sheets: :environment do
    url = "https://docs.google.com/spreadsheets/d/18pIMFkv3wcy7fXv7hNpFRfCOBff7hd6TrH9jvqqe6KQ/export?format=csv"
    response = HTTParty.get(url)

    event = nil
    CSV.parse(response.body).each do |row|
      if row.last == "Date" # Event Title
        event = Event.new(title: row[0])
      elsif row[0] == "Place" # Event Details
        event.points = row[2]
        event.prize_pool = money_to_integer row[3]
        event.buy_in = money_to_integer row[4]
        event.entrants = row[5]
        event.date = Date.strptime(row[6], "%m/%d/%y")
        event.save!
      elsif row[0] =~ /[0-9]/ # Player Place
        event.players.create!(
          place: row[0],
          name: row[1],
          points: row[2],
          prize: money_to_integer(row[3])
        )
      end
    end

    puts 'DONE'
  end

  def money_to_integer(string)
    string.gsub(/[^\d]/, '').to_i
  end
end
