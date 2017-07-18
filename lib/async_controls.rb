require "async_controls/engine"
require 'hyrax'

module AsyncControls
  def self.root
    Pathname.new(File.expand_path('../../', __FILE__))
  end
end
