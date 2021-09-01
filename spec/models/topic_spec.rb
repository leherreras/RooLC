# frozen_string_literal: true

# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  image      :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe Topic, type: :model do
  subject { build(:topic) }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
end
