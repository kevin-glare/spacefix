# frozen_string_literal: true

require "spacefix/version"
require 'active_support'

module Spacefix
  extend ActiveSupport::Concern
  
  DEFAULT_PARAMS = {
    squish: false,
    validate: true,
    message: 'Please removing excess whitespace'
  }

  included do
    before_validation :start_spacefix
  end

  class_methods do
    attr_accessor :spacefix_columns, :spacefix_options
  
    def spacefix_fields(*columns, **opts)
      self.spacefix_columns = columns
      self.spacefix_options = DEFAULT_PARAMS.merge(opts)
    end
  end

  protected
  
  def start_spacefix
    opts = self.class.spacefix_options
    self.class.spacefix_columns.each do |f|
      field = send(f)
      if check_field(field)
        errors.add(f, opts[:message]) if opts[:validate] && find_whitespace(field)
        field.squish! if opts[:squish]
      end
    end
  end
  
  def check_field(field)
    field.present? && (field.is_a? String)
  end
  
  def find_whitespace(field)
    field.index(/\A | \Z| {2,}/).present?
  end
end
