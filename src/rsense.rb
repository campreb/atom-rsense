require "native"
require "atom/atom"
require "rsense/client"
require "rsense/server"
require "rsense/utils"

module Rsense
  class Rsense
    include Native

    attr_accessor :atom, :editor_subscription, :providers, :autocomplete, :rsense_client

    def initialize
      @atom = Atom::Atom.new
      @rsense_client = Rsense::Client.new(@atom)
      @providers = []
    end

    def add_provider(provider)
      nprovider = Native(provider)
      @providers << nprovider
      nprovider.init(@rsense_client)
    end

    def clear_providers
      @providers = []
    end

  end
end
