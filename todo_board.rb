require './list.rb'

class TodoBoard

  def initialize
    @list = {}
  end

  def get_command
    print "\nEnter a command: "
    cmd, label, *args = gets.chomp.split(' ')

    case cmd
    when 'ls'
      @list.keys.each { |label| puts label }
    when 'showall'
      @list.each_value(&:print)
    when 'mklist'
      @list[label] = List.new(label)
    when 'mktodo'
      @list[label].add_item(*args)
    when 'up'
      @list[label].up(*args.map(&:to_i))
    when 'down'
      @list[label].down(*args.map(&:to_i))
    when 'swap'
      @list[label].swap(*args.map(&:to_i))
    when 'sort'
      @list[label].sort_by_date!
    when 'priority'
      @list[label].print_priority
    when 'toggle'
      @list[label].toggle_item(args[0].to_i)
    when 'rm'
      @list[label].remove_item(args[0].to_i)
    when 'purge'
      @list[label].purge
    when 'print'
      if args.empty?
        @list[label].print
      else
        @list[label].print_full_item(args[0].to_i)
      end
    when 'quit'
      return false
    else
      print 'Sorry that command is not recognized'
    end

    true
  end

  def run
    loop do
      return unless get_command
    end
  end
end

my_board = TodoBoard.new
my_board.run