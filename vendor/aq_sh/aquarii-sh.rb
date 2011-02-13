#!/usr/bin/env ruby

begin
  require 'pathname'
  base = Pathname(__FILE__).expand_path
  lib = base + "../lib/aq_lib.rb"

  require lib

  # kick start the thing :
  AqLib::Command.kickstart!(ARGV[0], ENV["SSH_ORIGINAL_COMMAND"])
  #AqLib::Command.kickstart!("marc@ananas.lan.sigpipe.me", "test")
rescue => e
  STDERR.puts "REMOTE: IIIaquarii: An error occured, please contact administrator."
  a=File.open(File.expand_path("../../../errors_aq_sh", __FILE__), "a")
  a << Time.now
  a << " - "
  a << e
  a << "\n"
  a.close
end
