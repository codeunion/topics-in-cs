class Histogram
  attr_reader :samples

  def initialize(samples)
    @samples = samples.freeze
  end

  def count(item)
    counts[item]
  end

  def frequency(item)
    frequencies[item]
  end

  def sample_count
    samples.count
  end

  def distinct_samples
    counts.keys
  end

  def distinct_sample_count
    distinct_samples.count
  end

  def to_table
    table = ""
    distinct_samples.inject("") do |table, sample|
      row = [sample, count(sample), frequency(sample)]

      table << (block_given? ? yield(row).join("\t") : row.join("\t"))
      table << "\n"
    end
  end

  private

  def counts
    @_counts ||= samples.inject(Hash.new(0)) do |counts, sample|
      counts[sample] += 1
      counts
    end
  end

  def frequencies
    total_samples = sample_count

    counts.inject(Hash.new(Rational(0))) do |freqs, (sample, count)|
      freqs[sample] = Rational(count, total_samples)

      freqs
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  samples = STDIN.readlines.map(&:chomp!)

  histogram = Histogram.new(samples)

  table = histogram.to_table do |sample, count, freq|
    [sample, count, sprintf("%7.4f%", 100 * freq)]
  end

  puts table
end
