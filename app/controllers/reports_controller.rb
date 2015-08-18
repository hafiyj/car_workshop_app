class ReportsController < ApplicationController
  before_action :logged_in_workshop, only: [:statistic, :appointment]
  
  def statistic
    # Fetch Recent 12 months Reservation Data
    @r_data = current_workshop.reservations.unscoped.
            where(created_at: 12.months.ago..Time.now, workshop_id: current_workshop.id)
    @r_data = @r_data.group_by_month
    # Declarations
    @reservation_data = Hash.new ()
    @key = Array.new
    @value = Array.new
    # Split the data and put into hash, and format the date of the fetched data
    @r_data.each do |k,v|
      @key << k.to_datetime.strftime("%B, %Y")
      @value << v
    end
    # Merge the date and value together back to new hash.
    for i in 0..@r_data.length-1 do
      @reservation_data[@key.at(i)] = @value.at(i)
    end

    ############################################################################
    # Fetch the data out from database for the Pie Chart (Service Type)
    @ty_data = current_workshop.reservations.unscoped.
              where(workshop_id: current_workshop.id)
    @type_data = @ty_data.group(:service_type).count

    ############################################################################
    #Fetch the data out form database for the Area Chart (Service Time)
    @ti_data = current_workshop.reservations.unscoped.
                        where(workshop_id: current_workshop.id)
    @ti_data = @ti_data.group_by_hour(:time)

    @time_data = Hash.new ()
    @t_key = Array.new
    @t_value = Array.new
    @f_time = Array.new
    # Split the data and put into hash
    @ti_data.each do |x,y|
      @t_key << x.to_time.utc.strftime('%I:%M %p').to_s
      @t_value << y
    end
    # Merge the date and value together back to new hash.
    for i in 0..@ti_data.length-1 do
      @time_data[@t_key.at(i)] = @t_value.at(i)
    end

  end

  def appointment
    # Fetch today's appoint from reservation database
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

    #Fetch the data out from database and use in the Table For
    @r_data = current_workshop.reservations.unscoped.
              where(workshop_id: current_workshop.id, date: Date.today).order(:time)
    @reserv_data = @r_data.paginate(:per_page => 10, :page => params[:page])
  end
end
