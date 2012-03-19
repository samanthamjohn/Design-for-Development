class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation,
    :remember_me, :available, :about, :looking_for, :city,
    :state, :company_name, :talent_type, :name,
    :design_skills, :development_skills, :other_skills,
    :links_attributes

  attr_accessor :design_skills, :development_skills, :other_skills

  after_initialize :initialize_skills
  before_save :add_skills

  has_many :skills
  has_many :links

  validates_presence_of :about, if: :available
  validates_presence_of :looking_for, if: :available
  validates_presence_of :city, if: :available
  validates_presence_of :talent_type, if: :available
  validates_presence_of :name, if: :available

  accepts_nested_attributes_for :skills
  accepts_nested_attributes_for :links

  private

  def add_skills
    skills = []
    self.design_skills ||= []
    self.development_skills ||= []
    self.design_skills.each do |skill|
      skill = Skill.new(skill_type: "design", name: skill) if skill.present?
      skills << skill if skill.present?
      Rails.logger.info(skill.valid?) if skill.present?
      Rails.logger.info(skill.errors.inspect) if skill.present?
    end

    self.development_skills.each do |skill|
      skills << Skill.new(skill_type: "development", name: skill) if skill.present?
    end

    skills << Skill.new(skill_type: "other", name: other_skills) if other_skills.present?
    self.skills = skills
  end

  def initialize_skills
    self.design_skills = []
    self.development_skills = []
    self.skills.each do |skill|
      if skill.skill_type == "design"
        self.design_skills << skill.name
      elsif skill.skill_type == "development"
        self.development_skills << skill.name
      end
    end
  end

end
