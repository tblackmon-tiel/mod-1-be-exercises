class Medusa
    attr_reader :name, :statues
    def initialize(name)
        @name = name
        @statues = []
    end

    def stare(victim)
        @statues << victim
        victim.toggle_stoned

        if @statues.length >= 4
            @statues[0].toggle_stoned
            @statues.shift
        end
    end
end

class Person
    attr_reader :name
    def initialize(name)
        @name = name
        @stoned = false
    end

    def toggle_stoned
        if @stoned == true
            @stoned = false
        else
            @stoned = true
        end
    end

    def stoned?
        @stoned
    end

end