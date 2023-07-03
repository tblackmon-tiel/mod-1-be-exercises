class Centaur
    attr_reader :name, :breed, :rested, :sick
    def initialize(name, breed)
        @name = name
        @breed = breed
        @cranky = false
        @standing = true
        @activity_counter = 0
        @rested = false
        @sick = false
    end

    def shoot
        if @cranky == true || @standing == false
            'NO!'
        else
            @activity_counter += 1
            set_cranky
            "Twang!!!"
        end
    end

    def run
        if @standing == false
            'NO!'
        else
            @activity_counter += 1
            set_cranky
            "Clop clop clop clop!"
        end
    end

    def sleep
        if @standing == true
            'NO!'
        else
            @cranky = false
            @activity_counter = 0
        end
    end

    def lay_down
        @standing = false
    end

    def stand_up
        @standing = true
    end

    def drink_potion
        if @standing == false
            'NO!'
        elsif @rested == true
            @sick = true
        else
            @rested = true
        end
    end

    def set_cranky
        if @activity_counter >= 3
            @cranky = true
        end
    end

    def cranky?
        @cranky
    end

    def standing?
        @standing
    end

    def laying?
        !@standing
    end
end