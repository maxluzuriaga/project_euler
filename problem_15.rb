# Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
# How many such routes are there through a 20×20 grid?

time = Time.now

$routes = []

def routes_to(x, y)
  if ($routes[x][y])
    return $routes[x][y]
  end

  val = 0

  if ((x == 0) || (y == 0))
    val =  1
  elsif (x == y)
    val =  2 * routes_to(x-1, y)
  else
    val =  routes_to(x - 1, y) + routes_to(x, y - 1)
  end

  return set(x, y, val)
end

def set(x,y, val)
  $routes[x][y] = val
end

def num_paths(size)
  $routes = (size + 1).times.map { |n| [nil] * (size + 1) }

  return routes_to(size, size)
end

puts num_paths(20)

puts "#{Time.now - time} seconds"
