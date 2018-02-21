every 1.day, at: '8:00 am' do
  rake "remind_report:report['morning']"
end

every 1.day, at: '13:30 pm' do
  rake "remind_report:report['noon']"
end

every 1.day, at: '16:00 pm' do
  rake "remind_report:report['afternoon']"
end
