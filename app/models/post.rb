# == Schema Information
#
# Table name: posts
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  body          :text
#  title         :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  rendered_body :text
#

class Post < ActiveRecord::Base

  before_save :render_body

  attr_accessible :title, :body, :user_id

  private

  def render_body
    require 'redcarpet'
    renderer = Redcarpet::Render::XHTML.new
    extensions = { xhtml: true, filter_html: true }
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    self.rendered_body = redcarpet.render(self.body)
  end
end
