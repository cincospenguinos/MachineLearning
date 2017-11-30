module MachineLearning

	# A single example from a dataset.
	class Example

		attr_reader :label
		attr_reader :features

		def initialize(label, features)
			@label = label
			@features = features
		end
	end
end