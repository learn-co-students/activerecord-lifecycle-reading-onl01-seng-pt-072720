class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case 

  before_validation :make_title_case

  before_save :email_author_about_post

  ### `before_create` is very close to `before_save` with one major difference: 
  # it only gets called when a model is created for the first time. 
  # This means not every time the object is persisted, just when it is new.

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def email_author_about_post
    # Not implemented.
    # For more information: https://guides.rubyonrails.org/action_mailer_basics.html
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
