class ReportsController < ApplicationController

  def reservation_report
    # Fetch Recent 12 months Reservation Data
    #@data = Reservation.where(:created_at => 12.months.ago..Time.now).group_by_month

    # @data = Reservation.select("DISTINCT ON (reservation.id) * ")
    #                    .where(created_at: 12.months.ago..Time.now)
    #                    .group('date(created_at)').size
    #@rdata = Reservation.where(created_at: 12.months.ago..Time.now)
    #@rdata2 = @rdata.group('date(created_at)').size
    #@data = @rdata.group_by_month
    @data = current_workshop.reservations.select("DISTINCT ON (reservation.created_at) * ")
                                         .where(created_at: 12.months.ago..Time.now)
                                         .group('date(created_at)').size

    # @data = case connection.adapter_name
    #   when 'SQLite'
    #     Dateslices::Sqlite.time_filter(column, field)
    #   when 'PostgreSQL', 'PostGIS'
    #     Dateslices::Postgresql.time_filter(column, field)
    #   when 'MySQL', 'Mysql2'
    #     Dateslices::Mysql.time_filter(column, field)
    #   else
    #     throw "Unknown database adaptor #{connection.adapter_name}"
    # end
    #@data3 = Reservation.all.group_by { |u| u.created_at.month }


    @reservation_report = Hash.new ()
    @key = Array.new
    @value = Array.new
    @formatted_date = Array.new

    @data.each do |k,v|
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
    for i in 0..@data.length-1 do
      @reservation_report[@formatted_date.at(i)] = @value.at(i)
    end

  end
end
