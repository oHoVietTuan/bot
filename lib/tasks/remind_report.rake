namespace :remind_report do
  desc "Remind Report"
  task :report, [:period] do |t, args|
    execute args[:period]
  end

  def execute period
    ChatWork.api_key = "56103bbfb4a20b44de0023391016dd0c"
    case period
    when "morning"
      message = "
[To:1908379][To:2310319]
Các em báo cáo cho anh dự kiến công việc sẽ làm trong ngày hôm nay vào đây nhé. (Kèm link redmine)

[info][title]Morning[/title]

[/info]
      "
    when "noon"
      message = "
[To:1908379][To:2310319]
Cho anh xin 500 tình hình hiện tại với, có vấn đề gì thì raise lên ngay nhé.

[info][title]Noon[/title]

[/info]
      "
    when "afternoon"
      message = "
[To:1908379][To:2310319]
Báo cáo tình hình công việc cuối ngày nào, nhớ LOG TIME trước khi về nhé mọi người.

[info][title]Daily Report[/title]

[/info]
      "
    end
    ChatWork::Message.create(room_id: 88263037, body: message)
  end
end
