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

require 'spec_helper'

describe Post do

  subject { Post.create(:title => '', :body => '', :user_id => 1) }

  specify { should be_valid }

  before do
    user = User.create(:name => 'Raphael G. Shekwolo', :email => 'ralphsheks@gmail.com',
                          :password => 'foobar', :password_confirmation => 'foobar')
    @post = Post.new(:title => 'The beginning', :body => 'This is the beginning of it all',
                     :user_id => user.id)
  end

  subject { @post }

  it { should respond_to(:title) }
  it { should respond_to(:body) }

end
