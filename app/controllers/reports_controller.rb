class ReportsController < ApplicationController

  def reservation_report
    # Fetch Recent 12 months Reservation Data
    @data = current_workshop.reservations.unscoped.
            where(created_at: 12.months.ago..Time.now, workshop_id: current_workshop.id)
    @groupped_data = @data.group_by_month
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

    @data = current_workshop.reservations.unscoped.
                        where(workshop_id: current_workshop.id)
    @reservation_type = @data.group(:service_type).count
  end
end
