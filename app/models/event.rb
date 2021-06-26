class Event < ApplicationRecord
  validate :name, length: { maximum: 50 }, presence: true
  validate :place, length: { maximum: 100 }, presence: true
  validate :content, length: { maximum: 50 }, presence: true
  validate :start_at, presence: true
  validate :end_at, presence: true
  validate :start_at_should_be_before_end_at

  private
  def start_at_should_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at,  "は終了時間よりも前に設定してください")
    end
  end
end
