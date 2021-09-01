# frozen_string_literal: true

# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  latitude   :float            not null
#  longitude  :float            not null
#  radius     :float            not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  topic_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_targets_on_title     (title)
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (topic_id => topics.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Target, type: :model do
  let(:target) { build(:target) }

  it 'validates name presence' do
    expect(target.title).to be_present
    expect(target.radius).to be_present
    expect(target.latitude).to be_present
    expect(target.longitude).to be_present
  end
end
