class Pirate
    attr_reader :name, :job, :booty
    def initialize(name, job = "Scallywag")
        @name = name
        @job = job
        @cursed = false
        @heinous_acts_committed = 0
        @booty = 0
    end

    def cursed?
        @cursed
    end

    def commit_heinous_act
        @heinous_acts_committed += 1
        if @heinous_acts_committed >= 3
            @cursed = true
        end
    end

    def rob_ship
        @booty += 100
    end

end