require 'axe'

module Axe
  class Loader
    def initialize(page, lib)
      @page = page
      @lib = lib
    end

    def call
      @page.execute_script @lib.source unless already_loaded?
      Axe.configuration.run_after_load_hook @lib
    end

    private

    def already_loaded?
      @page.evaluate_script @lib.already_loaded?
    end
  end
end
