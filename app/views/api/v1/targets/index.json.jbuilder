# frozen_string_literal: true

json.array! @targets, partial: 'api/v1/targets/target', as: :target
