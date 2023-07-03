class Werewolf
    attr_reader :name, :location, :hungry
    def initialize(name, location = "")
        @name = name
        @location = location
        @human = true
        @hungry = false
    end

    def consume(victim)
        if @human == true
            "The wolf is a human and can't consume its victim!"
        else
            @hungry = false
            victim.status = :dead
            "A victim was consumed!"
        end
    end

    def change!
        # this is probably cleaner
        # @human = !@human
        if @human == true
            @human = false
            @hungry = true
        else
            @human = true
        end
    end

    def human?
        @human
    end

    def wolf?
        !@human
    end

end