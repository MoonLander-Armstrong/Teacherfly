# frozen_string_literal: true

module Slugable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId
    friendly_id :random_slug, use: :slugged
  end

  private

  def random_slug
    [*'0'..'9'].sample(6).join
  end
end
