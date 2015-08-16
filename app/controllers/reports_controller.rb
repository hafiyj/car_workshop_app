class ReportsController < ApplicationController

  def statistic
    # Fetch Recent 12 months Reservation Data
    @r_data = current_workshop.reservations.unscoped.
            where(created_at: 12.months.ago..Time.now, workshop_id: current_workshop.id)
    @groupped_data = @r_data.group_by_month
    # Declarations
    @reservation_report = Hash.new ()
    @key = Array.new
    @value = Array.new
    @formatted_date = Array.new
    # Split the data and put into hash
    @groupped_data.each do |k,v|
      @key << k.to_datetime
      @value << v
    end
    # Format the date of the fetched data
    @key.each do |r|
      temp = r.to_datetime
      temp = temp.strftime("%B, %Y")
      temp = temp.to_s
      @formatted_date << temp
    end
    # Merge the date and value together back to new hash.
    for i in 0..@groupped_data.length-1 do
      @reservation_report[@formatted_date.at(i)] = @value.at(i)
    end

    @t_data = current_workshop.reservations.unscoped.
                        where(workshop_id: current_workshop.id)
    @reservation_type = @t_data.group(:service_type).count
  end

  def appointment
    @a_data = current_workshop.reservations.unscoped.
            where(workshop_id: current_workshop.id, date: Date.today)
    @a_groupped_data = @a_data.group_by_hour(:time)
    # Declarations
    @appointment_data = Hash.new ()
    @a_key = Array.new
    @a_value = Array.new
    @formatted_time = Array.new
    # Split the data and put into hash
    @a_groupped_data.each do |x,y|
      @a_key << x.to_time
      @a_value << y
    end
    # Format the date of the fetched data
    @a_key.each do |r|
      t = r.utc
      t = r.strftime('%I:%M %p')
      t = t.to_s
      @formatted_time << t
    end
    # Merge the date and value together back to new hash.
    for i in 0..@a_groupped_data.length-1 do
      @appointment_data[@formatted_time.at(i)] = @a_value.at(i)
    end
  end
end
