require 'spec_helper'

describe ActionParser do
  context "action is active" do
    it "should recognize an action as active when 'true' is set for its controller" do
      @parser = ActionParser.new :gargamels, :waffles, {:gargamels => true}
    end

    it "should recognize an action as active when listed in an array of active actions" do
      @parser = ActionParser.new :gargamels, :waffles, {:gargamels => [:bacon, :waffles]}
    end

    it "should recognize an action as active when it is the only action specified" do
      @parser = ActionParser.new :gargamels, :waffles, {:gargamels => [:waffles]}
    end

    after(:each) do
      @parser.active?.should be_true
    end
  end

  context "action is inactive" do
    it "should not be active if the controller doesn't matches but the action does" do
      @parser = ActionParser.new :smurfs, :waffles, {:gargamels => [:waffles]}
    end

    it "should not be active if the controller matches but the action doesn't" do
      @parser = ActionParser.new :gargamels, :goats, {:gargamels => [:waffles]}
    end

    it "should not be active if the controller doesn't match but all actions are allowed" do
      @parser = ActionParser.new :smurfs, :goats, {:gargamels => true}
    end

    after(:each) do
      @parser.active?.should be_false
    end
  end
end
