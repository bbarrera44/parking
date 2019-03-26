require 'time'
class Entry < ApplicationRecord

  belongs_to :rate #entrada pertenece a una tarifa
  belongs_to :vehicle
  belongs_to :parking

  def verify_entries
    Entry.where('exit_time is null and vehicle_id = ? ', vehicle_id).exists?
  end
  def calculate_minutes
    entry_time.to_time
    Time.now.to_time
    total_time = TimeDifference.between(entry_time, Time.now.to_time).humanize
    total_time
  end
  def format_time_exit
    date_a = entry_time.strftime("%Y-%m-%d")
    hour_a = entry_time.strftime("%H:%M:%S")
    ("#{date_a} #{hour_a}").to_time

  end
  def format_time_entry
    date_a = Time.now.strftime("%Y-%m-%d")
    hour_a = Time.now.strftime("%H:%M:%S")
    ("#{date_a} #{hour_a}").to_time
  end
  def calcule_minutes_1
    (format_time_exit - format_time_entry).abs/60
  end


end
