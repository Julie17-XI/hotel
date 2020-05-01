require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name,hash)
        @name=name
        @rooms={}
        hash.each do |k,v|
            @rooms[k]=Room.new(v)
        end
    end

    def name
        @name.split(" ").map(&:capitalize).join(" ")
    end

    def room_exists?(room_name)
        if @rooms.has_key?(room_name)
            true
        else
            false
        end
    end

    def check_in(person,room_name)
        if room_exists?(room_name)
            if @rooms[room_name].add_occupant(person)
                puts "check in successful"
            else
                puts "sorry, room is full"
            end
        else
            puts "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each do |k,v|
            if !@rooms[k].full?
                return true
            end
        end
        false
    end

    def list_rooms
        @rooms.each do |k,v|
            puts "#{k}: #{@rooms[k].available_space}"
        end
    end
end
