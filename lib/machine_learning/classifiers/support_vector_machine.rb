module MachineLearning

	# Support Vector Machine linear classifier. Takes two hyper parameters: learning rate
	# and tradeoff.
	class SupportVectorMachine < MachineLearning::Classifier
		attr_reader :learning_rate
	  attr_reader :tradeoff

	  def initialize(examples, learning_rate, tradeoff, epochs=10)
	    @weights = []

	    examples.each do |e|
	    	while e.features.size > @weights.size do
	    		@weights << @@random.rand(0.0...1.0)
	    	end
	    end

	    epochs.times do
	      examples.shuffle

	      examples.each do |e|
	        prod = dot_product(e) * e.label

	        if prod <= 1
	          e.features.each { |f| @weights[f] = (1 - learning_rate) * @weights[f] + learning_rate * tradeoff * e.label }
	        else
	          e.features.each { |f| @weights[f] = (1 - learning_rate) * @weights[f] }
	        end
	      end
	    end

	    @learning_rate = learning_rate
	    @tradeoff = tradeoff
	  end

	  def guess_for(example)
	    dot_product(example) * example.label >= 1 ? 1 : -1
	  end

	  private

	  def dot_product(example)
	  	while example.features.size > @weights.size do
	    	@weights << @@random.rand(0.0...1.0)
	    end
	    
	    res = 0.0
	    example.features.each { |f| res += @weights[f] unless @weights[f].nil? }
	    res
	  end
	end
end