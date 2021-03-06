class Post < ActiveRecord::Base
  include ActiveModel::Validations
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Nonfiction)}
  validate :clickbait

  def clickbait
    if title != nil && !title.include?("Won\'t Believe" || "Secret" || "Top" || "Guess" ||"You Won\'t")
      errors.add(:title, "Not clickbait title")
    end
  end
end
