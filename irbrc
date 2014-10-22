require 'irb/ext/save-history'
require "awesome_print"

IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

def clear
  puts `clear`
end
