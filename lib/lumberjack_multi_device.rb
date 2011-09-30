require "lumberjack_multi_device/version"
require 'lumberjack'

module Lumberjack
  class Device
    class Multi < Device
      attr_accessor :devices

      def initialize(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        @devices = args
      end

      def write(entry)
        devices.each { |d| d.write(entry) }
      end

      def close
        devices.each { |d| d.close }
      end

      def flush
        devices.each { |d| d.flush }
      end
    end
  end
end
