class Ogre
    attr_reader :name, :home, :swings, :encounter_counter
    def initialize(name, home = 'Swamp')
        @name = name
        @home = home
        @swings = 0
        @encounter_counter = 0
    end

    def encounter(target)
        target.encounter_counter += 1
        @encounter_counter += 1

        if target.notices_ogre? == true
            swing_at(target)
        end
    end

    def swing_at(target)
        @swings += 1
        if @swings % 2 == 0
            target.knocked_out = true
        end
    end

    def apologize(target)
        target.knocked_out = false
    end
end

class Human
    attr_reader :name
    attr_accessor :encounter_counter, :knocked_out
    def initialize()
        @name = 'Jane'
        @encounter_counter = 0
        @knocked_out = false
    end

    def notices_ogre?
        if @encounter_counter % 3 == 0
            true
        else
            false
        end
    end

    def knocked_out?
        @knocked_out
    end
end