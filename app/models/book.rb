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
class Book < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  validate :ensure_slug_uniqueness

  protected

  def ensure_slug_uniqueness
    if self.slug.blank?
      errors.add(:slug, 'cannot be blank')
    end

    unless Slug[self.slug].nil? || Slug[self.slug] == self.id.to_s
      errors.add(:slug), 'is already taken'
    end
  end
end
