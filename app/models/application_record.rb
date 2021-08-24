# frozen_string_literal: true

# The active record base
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
