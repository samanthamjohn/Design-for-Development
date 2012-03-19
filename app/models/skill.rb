class Skill < ActiveRecord::Base
  DEVELOPMENT_SKILLS = %w(
  html
  css
  javascript
  ruby
  python
  scala
  )

  DESIGN_SKILLS = %w(
  ui
  ux
  branding
  illustration
  identity
  )

  belongs_to :user
  validates :skill_type, presence: true
  validates :name, presence: true
  validates :user, presence: true
  validate :skill_in_list

  private

  def skill_in_list
    if skill_type == 'design'
      errors[:base] << "Must be in the design skill list" unless DESIGN_SKILLS.include?(name)
    elsif skill_type == "development"
      errors[:base] << "Must be in the design skill list" unless DEVELOPMENT_SKILLS.include?(name)
    end
  end
end
