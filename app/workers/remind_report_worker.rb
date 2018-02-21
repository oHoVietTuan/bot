class RemindReportWorker
  include Sidekiq::Worker
  require "chatwork"

  def perform
    Chatwork.api_key = "56103bbfb4a20b44de0023391016dd0c"
    message = "
      [To:1908379] Nguyen Ha Phan (95)
      [To:2310319] Nguyen Van Hoan
      [To:2692816] Hồ Việt Tuấn
      [info][title]Daily Report[/title]
      Hello World
      [/info]
    "
    Chatwork::Message.create(room_id: 87821038, body: message)
    # current_time = Time.zone.now.strftime("%H:%M")
    # report_time = { morning: "10:28", noon: "13:30", afternoon: "16:00"}
    # if report_time.has_value? current_time
    #   byebug
    #   RemindReportService.execute
    # end
  end

  RemindReportWorker.perform_in(5.second)
end
