require 'matrix'

Point = Struct.new(:x, :y)
p1 = Point.new(1, 2)
p2 = Point.new(3, 5.5)
p3 = Point.new(6, 6)

def fit_curve(p1, p2, p3)
  y = Matrix.column_vector([p1.y, p2.y, p3.y])
  x = Matrix.rows([[p1.x ** 2, p1.x, 1], [p2.x ** 2, p2.x, 1], [p3.x ** 2, p3.x, 1]])
  coefficients = (x.inv * y).column(0)
  lambda do |x|
    coefficients[0] * x ** 2 + coefficients[1] * x + coefficients[2]
  end
end

quadratic = fit_curve(p1, p2, p3)
p quadratic.(p1.x)
p quadratic.(p2.x)
p quadratic.(p2.x)
