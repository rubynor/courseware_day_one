module RubyKurs

  class Tree
    include Enumerable
    attr_accessor :children, :node_value

    def initialize(value = nil)
      @node_value = value
      @children = []
    end
    
    def add(child)
      @children.push child
    end
    
    def each
      traverse_down { |node| yield(node) }
    end

    # Run given block on current node and all its descendants recursively
    def traverse_down(&block)
      block.call(self)
      if(!children.nil?)
        children.each{ |child| child.traverse_down(&block) }
      end
    end

    def to_s(indentation=0)
      node_descr = ""
      indentation.times { node_descr.concat "  " }
      node_descr.concat "#{@node_value}\n"    
      if (!children.nil?)
        children.each do |child| 
          node_descr.concat("#{child.to_s(indentation+1)}")
        end
      end
      return node_descr
    end
    
  end

end
