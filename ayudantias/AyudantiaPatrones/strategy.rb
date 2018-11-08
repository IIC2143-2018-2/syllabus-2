class Report
  attr_accessor :formatter, :sender

  def initialize(formatter, sender, text)
    @formatter = formatter
    @sender = sender
    @text = text
  end

  def format
    @formatter.format(@text)
  end

  def send
    @sender.send(format)
  end
end

class Formatter
  def format(_text)
    raise NotImplementedError
  end
end

class DocumentFormatter < Formatter
  def format(text)
    "Header: #{text}"
  end
end

class HtmlFormatter < Formatter
  def format(text)
    "<h1>#{text}</h1>"
  end
end

class Sender
  def send(_text)
    raise NotImplementedError
  end
end

class EmailSender < Sender
  def send(text)
    puts "Sending '#{text}' via email"
  end
end

class PidgeySender < Sender
  def send(text)
    puts "Sending '#{text}' via pidgey"
  end
end

report = Report.new(DocumentFormatter.new, EmailSender.new, 'Gran Ayudantia')

report.send

report.formatter = HtmlFormatter.new

report.send

report.sender = PidgeySender.new

report.send
