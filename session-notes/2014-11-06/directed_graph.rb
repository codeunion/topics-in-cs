require 'set'
require_relative 'queue'

class Vertex
  include Enumerable

  attr_accessor :value
  attr_reader :neighbors

  def initialize(value)
    @value = value
    @neighbors = Set.new
  end

  def add_neighbor(vertex)
    raise "No self-edges" if vertex == self

    @neighbors << vertex
  end

  def neighbor?(vertex)
    neighbors.include?(vertex)
  end

  def each
    queue    = Queue.new
    enqueued = Set.new

    enqueued.push(self)
    queue.enqueue(self)

    until queue.empty? do
      current = queue.dequeue

      yield(current)

      current.neighbors.each do |neighbor|
        unless enqueued.include?(neighbor)
          enqueued.push(neighbor)
          queue.enqueue(neighbor)
        end
      end
    end
  end
end
