require 'gst'

module Speak

  def self.play(uri)
    pipeline = Gst::ElementFactory.make('playbin')
    pipeline.uri = uri

    loop = GLib::MainLoop.new(nil, false)

    # listen to playback events
    bus = pipeline.bus
    bus.add_watch do |bus, message|
      case message.type
      when Gst::Message::EOS
        loop.quit
      when Gst::Message::ERROR
        puts message.parse
        loop.quit
      end
      true
    end

    # start playing
    pipeline.play
    begin
      loop.run
    rescue Interrupt
    ensure
      pipeline.stop
    end
  end

end
