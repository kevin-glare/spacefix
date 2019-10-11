# frozen_string_literal: true

require "spacefix/version"
require 'active_support'

module Spacefix
  extend ActiveSupport::Concern

  included do
    before_validation :spacefix!
  end

  module ClassMethods
    attr_accessor :spacefix_columns

    def set_spacefix(*columns)
      self.spacefix_columns = columns
    end
  end

  protected

  def spacefix!
    self.class.spacefix_columns.each do |f|
      field = self.send(f)
      field.spacefix! if field.present? && (field.is_a? String)
    end
  end
end