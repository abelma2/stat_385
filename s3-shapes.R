# calc_area --------------------------------------------------------------

calc_area = function(x) {
  UseMethod("calc_area")
}

calc_area.circle = function(x) {
  return(pi * x$radius ^ 2)
}

calc_area.rectangle = function(x) {
  return(x$length * x$width)
}


calc_area.triangle = function(x) {
  return(0.5 * x$a * x$b)
}

calc_area.default = function(x) {
  print(paste0("No calc_area method for class ", class(x), "."))
}

# calc_perimeter ----------------------------------------------------------

calc_perimeter = function(x) {
  UseMethod("calc_perimeter")
}

calc_perimeter.circle = function(x) {
  return(2 * pi * x$radius)
}

calc_perimeter.rectangle = function(x) {
  return(2 * x$length + 2 * x$width)
}

calc_perimeter.triangle = function(x) {
  c = sqrt(x$a ^ 2 + x$b ^ 2)
  return(x$a + x$b + c)
}


calc_perimeter.default = function(x) {
  print(paste0("No calc_perimeter method for class ", class(x), "."))
}

# print method ------------------------------------------------------------

print.circle = function(x) {
  print(paste0("This is a circle with radius ",
               x$radius,
               "."))
}

print.rectangle = function(x) {
  print(paste0("This is a rectangle with length ",
               x$length,
               " and width ",
               x$width,
               "."))
}

print.triangle = function(x) {
  print(paste0("This is a triangle with a ",
               x$a,
               " and b ",
               x$b,
               "."))
}




# validators --------------------------------------------------------------

validate_circle = function(x) {
  if (!is.list(x) || length(x) != 1 || names(x) != "radius") {
    stop("A circle must be a list with one named element radius.")
  }
  if (class(x) != "circle") {
    stop("A class must have class circle.")
  }
  if (!is.numeric(x$radius) || length(x$radius) != 1) {
    stop("A circle's radius must be a length one numeric vector.")
  }
  if (x$radius <= 0) {
    stop("A circle's radius must be positive.")
  }
  return(x)
}

validate_rectangle = function(x) {
  if (!is.list(x) || length(x) != 2 || !all.equal(names(x), c("length", "width"))) {
    stop("A rectangle must be a list with two named elements, length and width.")
  }
  if (class(x) != "rectangle") {
    stop("A rectangle must have class rectangle.")
  }
  if (!is.numeric(x$length) || !is.numeric(length(x$width))) {
    stop("A retangle's length and width must be length one numeric vectors.")
  }
  if (length(x$length) != 1 || length(x$width) != 1) {
    stop("A rectangle's length and width must be length one numeric vectors.")
  }
  if (x$length <= 0 || x$width <= 0) {
    stop("A rectangle must have positive length and width.")
  }
  return(x)
}

validate_triangle = function(x) {
  if (!is.list(x) || length(x) != 2 || !all.equal(names(x), c("a", "b"))) {
    stop("A triangle must be a list with two named elements, a and b.")
  }
  if (class(x) != "triangle") {
    stop("A triangle must have class triangle.")
  }
  if (!is.numeric(x$a) || !is.numeric(x$b)) {
    stop("A triangle's a and b must be length one numeric vectors.")
  }
  if (length(x$a) != 1 || length(x$b) != 1) {
    stop("A triangle's a and b must be lenght one numeric vectors.")
  }
  if (x$a <= 0 || x$b <= 0) {
    stop("A triangle must have positive a and b.")
  }
  return(x)
}





# constructors ------------------------------------------------------------

new_circle = function(radius) {
  x = structure(list(radius = radius),
                class = "circle")
  validate_circle(x)
}

new_rectangle = function(length, width) {
  x = structure(list(length = length,
                     width = width),
                class = "rectangle")
  validate_rectangle(x)
}

new_triangle = function(a, b) {
  x = structure(list(a = a,
                     b = b),
                class = "triangle")
  validate_triangle(x)
}
