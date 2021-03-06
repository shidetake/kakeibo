class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :group
  belongs_to :source
  belongs_to :store
  belongs_to :wallet

  scope :with_category, -> { includes(:category) }
  scope :category_id, ->(category_id) { where(transactions: {category_id: category_id}) }
  scope :parent_id, ->(parent_id) { where(categories: {parent_id: parent_id}) }
  scope :group_id, ->(group_id) { where(transactions: {group_id: group_id}) }
  scope :valid, -> { where(transactions: {valid_record: 1}) }
  scope :total, -> { sum(:yen) }
  scope :month, ->(year, month) { where(transactions: {created_at: Time.new(year, month, 1).all_month}) }
  scope :not_nae, -> { where.not(transactions: {source_id: [18, 20]}) }
  scope :not_central, -> { where.not(transactions: {source_id: [5, 7, 16, 23, 25, 26, 30]}) }
  scope :central, -> { where(transactions: {source_id: [5, 7, 16, 23, 25, 26, 30]}) }

  def parent_category_id
    category.parent.nil? ? category_id : category.parent.id
  end

  def store_name
    store.nil? ? '' : store.name
  end
end
