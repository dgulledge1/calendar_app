require 'rubygems'
require 'net/smtp'
require 'sqlite3'
require 'open-uri' 
require 'date'

#date_time = DateTime.now
#date_time = (date_time.to_time - 1.hours).to_datetime #strftime("%Y-%m-%d %H:%M") #"2013-06-07 12:26"
#puts date_time 
#date_time = DateTime.now
# Open a SQLite 3 database file

smtp = Net::SMTP.new 'smtp.gmail.com', 587
smtp.enable_starttls
smtp.start('gmail.com', 'emailyoulaterteam@gmail.com', 'emailyoulater2013', :login)

db = SQLite3::Database.new 'C:\Users\dgulledge\Documents\rails_projects\cal-test\db\development.sqlite3'
db.execute 'select * from events where (time(start_at) between time("now", "-5 hour") and time("now", "-4 hour")) and (date() between date(start_at) and date(end_at))' do |row|
#db.execute 'SELECT * FROM events' do |row|
	event = row[1]
	start_at = row[2]
  end_at = row[3]
	to = row[6]
	puts to 
	puts event

#db.execute 'select * from events where start_at between date ("now") and date ("now", "+1 hour")' do |row|
#db.execute ' select datetime() '  do |row|
#puts row

=begin
 to = row[1]
 event = row[2]
 start_time = row[3].slice(0..15)
 end_time = row[4].slice(0..15)
 puts to
 puts event
 puts start_time
 puts end_time
 puts date_time
=end




start_at = start_at.chomp(":00.000000")
end_at = end_at.chomp(":00.000000")

message = <<EOF
From: teamaqua@whatever.com
To: #{to}
Subject: #{event} #{start_at} #{end_at}
#{event}
EOF
 
smtp.send_message message, 'emailyoulaterteam@gmail.com', "%s" % [to]
smtp.finish

end 
#Using Block
#smtp = Net::SMTP.new('smtp.gmail.com', 587 )
#smtp.enable_starttls
#smtp.start('gmail.com', 'joshpadilla86@gmail.com', 'NUkster$23;1986;', :login) do |smtp|
#        smtp.send_message message, 'joshpadilla86@gmail.com', 'jpadilla@neuone.com'
#end

#end

