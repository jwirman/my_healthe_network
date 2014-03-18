# == Schema Information
#
# Table name: users_meds
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  med_id       :integer
#  freq         :string(255)
#  freq_unit    :string(255)
#  num_per_dose :integer
#  start        :date
#  first_dose   :time
#  second_dose  :time
#  third_dose   :time
#  fourth_dose  :time
#  fifth_dose   :time
#  sixth_dose   :time
#  window       :integer          default(5), not null
#  num_doses    :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class UsersMed < ActiveRecord::Base
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................
  belongs_to :user
  belongs_to :med

  # validations ...............................................................
  validates :med_id, presence: true, allow_blank: false
  validates :start, presence: true, allow_blank: false
  validates :first_dose, presence: true, allow_blank: false
  validates :num_per_dose, allow_nil: true,
                           numericality: { greater_than: 0, only_integer: true }
  validates :num_doses, presence: true,
                        allow_blank: false,
                        numericality: { greater_than: 0, only_integer: true }
  validates :freq, presence: true,
                   allow_blank: false,
                   inclusion: { in: Med::FREQUENCIES.values }
  validates :window, presence: true,
                     allow_blank: false,
                     inclusion: { in: Med::WINDOWS.map{|str| str.to_i} }

  # callbacks .................................................................
  after_create :add_to_chart
  after_update :update_chart
  after_destroy :remove_from_chart

  # scopes ....................................................................
  scope :between, -> (start_date, end_date) {
    where("start >= ? AND start <= ?", start_date, end_date)
  }

  # additional config .........................................................
  serialize :freq_unit

  # class methods .............................................................
  def self.new_based_on_freq_type(options={})
    case options[:freq]
      when /daily/
        DailyUsersMed.new(options)
      when 'weekly'
        WeeklyUsersMed.new(options)
      when 'monthly'
        MonthlyUsersMed.new(options)
      when /every/
        HourlyUsersMed.new(options)
      else
        UsersMed.new(options)
    end
  end

  # public instance methods ...................................................
  def dose_times
    [first_dose]
  end

  def dose_datetime(date=start)
    DateTime.new(date.year, date.month, date.day,
                 first_dose.hour, first_dose.min, first_dose.sec)
  end

  def days_remaining(date = Date.today)
    days_diff = (start - date).to_i
    num_doses + days_diff
  end

  def event_data
    events = []
    Chart.where(user_id: user_id, med_id: med_id).each do |dose|
      events << { id: id,
                  title: med.to_s,
                  start: dose.taken_at.utc - window.minutes,
                  end: dose.taken_at.utc + window.minutes,
                  allDay: false }
    end
    events
  end

  def frequency_number
    if digit = /\d+/.match(freq)
      return digit[0].to_i
    else
      return 1
    end
  end

  # protected instance methods ................................................
  # private instance methods ..................................................
  private

  def add_to_chart
    end_date = start + days_remaining(start).days - 1.day
    start.upto(end_date) do |day|
      datetime = dose_datetime(day)
      Chart.create!(user_id: user_id, med_id: med_id, taken_at: datetime)
    end
  end

  def update_chart
    remove_from_chart
    add_to_chart
  end

  def remove_from_chart
    Chart.where(user_id: user_id, med_id: med_id).delete_all
  end

end
