# == Schema Information
#
# Table name: books
#
#  id          :integer          not null, primary key
#  description :string
#  slug        :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_books_on_slug  (slug) UNIQUE
#
require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
