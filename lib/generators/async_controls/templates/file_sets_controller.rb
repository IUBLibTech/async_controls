module Hyrax
  class FileSetsController < ApplicationController
    include Hyrax::FileSetsControllerBehavior
    include AsyncControls::AsyncControlsBehavior
  end
end
