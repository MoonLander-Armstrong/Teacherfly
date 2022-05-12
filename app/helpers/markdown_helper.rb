# frozen_string_literal: true

module MarkdownHelper
  def markdown(content)
    tag.article data: { controller: 'markdown-viewer' } do
      content
    end
  end
end
